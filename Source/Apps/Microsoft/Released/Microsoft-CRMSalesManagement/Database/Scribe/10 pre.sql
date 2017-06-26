SET ANSI_NULLS              ON;
SET ANSI_PADDING            ON;
SET ANSI_WARNINGS           ON;
SET ANSI_NULL_DFLT_ON       ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER       ON;
go

-- Must be executed inside the target database
-- Regular views
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='accountview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.accountview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='actualsalesview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.actualsalesview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='businessunitview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.businessunitview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='dateview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.dateview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='leadview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.leadview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='measuresview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.measuresview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='opportunityproductview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.opportunityproductview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='opportunityview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.opportunityview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='productview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.productview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='quotaview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.quotaview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='targetview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.targetview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='tempuserview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.tempuserview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='territoryview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.territoryview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='userview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.userview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='userascendantsview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.userascendantsview;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='configurationview' AND TABLE_TYPE='VIEW')
    DROP VIEW smgt.configurationview;

-- Tables
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='actualsales' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.actualsales;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='configuration' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.configuration;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='date' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.[date];
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='quotas' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.quotas;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='targets' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.targets;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='smgt' AND TABLE_NAME='usermapping' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE smgt.usermapping;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='account' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.account;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='businessunit' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.businessunit;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='lead' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.lead;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='opportunity' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.opportunity;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='opportunityproduct' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.opportunityproduct;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='product' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.product;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='scribe_replicationstatus' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.scribe_replicationstatus;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='systemuser' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.systemuser;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='systemusermanagermap' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.systemusermanagermap;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='territory' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE dbo.territory;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='sp_get_replication_counts' AND ROUTINE_TYPE='PROCEDURE')
    DROP PROCEDURE dbo.sp_get_replication_counts;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='sp_get_prior_content' AND ROUTINE_TYPE='PROCEDURE')
    DROP PROCEDURE dbo.sp_get_prior_content;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name='smgt')
BEGIN
    EXEC ('CREATE SCHEMA smgt AUTHORIZATION dbo'); -- Avoid batch error
END;
