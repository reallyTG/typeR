library(RODBC)


### Name: odbcGetInfo
### Title: Request Information on an ODBC Connection
### Aliases: odbcGetInfo
### Keywords: IO database

### ** Examples
## Not run: 
##D odbcGetInfo(channel) # under Windows XP
##D ## MySQL returned
##D              DBMS_Name               DBMS_Ver        Driver_ODBC_Ver
##D                "MySQL"     "5.1.35-community"                "03.51"
##D       Data_Source_Name            Driver_Name             Driver_Ver
##D              "testdb5"          "myodbc5.dll"           "05.01.0005"
##D               ODBC_Ver            Server_Name
##D           "03.52.0000" "localhost via TCP/IP"
##D ## MS Access returned
##D        DBMS_Name         DBMS_Ver  Driver_ODBC_Ver Data_Source_Name
##D         "ACCESS"     "04.00.0000"          "03.51"        "testacc"
##D      Driver_Name       Driver_Ver         ODBC_Ver      Server_Name
##D   "odbcjt32.dll"     "04.00.6305"     "03.52.0000"         "ACCESS"
##D ## SQL Server 2008 Express returned
##D              DBMS_Name               DBMS_Ver        Driver_ODBC_Ver
##D "Microsoft SQL Server"           "10.00.1600"                "03.52"
##D       Data_Source_Name            Driver_Name             Driver_Ver
##D            "SQLServer"          "SQLNCLI.DLL"           "09.00.4035"
##D               ODBC_Ver            Server_Name
##D           "03.52.0000"      "AUK\\SQLEXPRESS"
## End(Not run)


