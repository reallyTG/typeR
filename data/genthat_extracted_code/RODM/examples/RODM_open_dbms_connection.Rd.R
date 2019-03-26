library(RODM)


### Name: RODM_open_dbms_connection
### Title: Open a connection to an Oracle Database
### Aliases: RODM_open_dbms_connection

### ** Examples

# Given a database user rodm, establish a connection to the orcl11g
# database.
# The database user would need privileges as described above, and could
# have been created in a fashion similar to:
# grant create session, create table, create view, create mining model, 
#       unlimited tablespace to rodm identified by rodm;
## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid="rodm", pwd="rodm")
##D 
##D # Close the connection to the database.
##D RODM_close_dbms_connection(DB)
## End(Not run)



