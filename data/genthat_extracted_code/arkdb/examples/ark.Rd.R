library(arkdb)


### Name: ark
### Title: Archive tables from a database as flat files
### Aliases: ark

### ** Examples

## No test: 
# setup
library(dplyr)
dir <- tempdir() 
db <- dbplyr::nycflights13_sqlite(tempdir())

## And here we go:
ark(db, dir)
## End(No test) 
## Not run: 
##D 
##D ## For a Postgres DB with schema, we can append schema names first
##D ## to each of the table names, like so: 
##D schema_tables <- dbGetQuery(db, sqlInterpolate(db,
##D "SELECT table_name FROM information_schema.tables 
##D WHERE table_schema = ?schema", schema = "schema_name"))
##D 
##D ark(db, dir, tables = paste0("schema_name",".", schema_tables$table_name))
## End(Not run)




