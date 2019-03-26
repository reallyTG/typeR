library(RODM)


### Name: RODM_create_dbms_table
### Title: Create a table in the Oracle Database
### Aliases: RODM_create_dbms_table

### ** Examples

## Not run: 
##D data(titanic3, package="PASWR")
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid="rodm", pwd="rodm")
##D 
##D # Move the titanic3 data frame to a new table in the Oracle database
##D RODM_create_dbms_table(DB, "titanic3")
##D 
##D # Now drop the table (just to clean up from this example)
##D RODM_drop_dbms_table(DB, "titanic3")
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



