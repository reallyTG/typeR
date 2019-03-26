library(RODM)


### Name: RODM_drop_dbms_table
### Title: Drops a table in the Oracle Database
### Aliases: RODM_drop_dbms_table

### ** Examples

## Not run: 
##D data(titanic3, package="PASWR")
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid="rodm", pwd="rodm")
##D RODM_create_dbms_table(DB, "titanic3")
##D 
##D # Drop the titanic3 database table
##D RODM_drop_dbms_table(DB, "titanic3")
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



