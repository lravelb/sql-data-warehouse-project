/* 
====================================================================================================
Create Database and Schemas
=====================================================================================================
Script Purpose:
	This script created a new database name 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated.
	Additionally, the scripts sets up three schemas within the database: 'bronze', 'silver' and 'gold'.

WARNING:
	Running the script will drop the entire 'Datawarehouse' database if it exists.
	All data in database will be permanently deleted.
	Proceed with caution and ensure you haver proper backups before running this script.
*/


USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK INMEDIATE; -- Set only one user and close all active conections
	DROP DATABASE DataWarehouse;
END;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
