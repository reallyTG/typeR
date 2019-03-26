library(etl)


### Name: smart_upload
### Title: Upload a list of files to the DB
### Aliases: smart_upload

### ** Examples

## Not run: 
##D if (require(RMySQL)) {
##D   # must have pre-existing database "fec"
##D   # if not, try
##D   system("mysql -e 'CREATE DATABASE IF NOT EXISTS fec;'")
##D   db <- src_mysql_cnf(dbname = "mtcars")
##D }
## End(Not run)



