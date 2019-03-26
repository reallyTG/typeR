library(implyr)


### Name: tbl
### Title: Create a lazy 'tbl' from an Impala table
### Aliases: tbl tbl.src_impala

### ** Examples

## Not run: 
##D flights_tbl <- tbl(impala, "flights")
##D 
##D flights_tbl <- tbl(impala, in_schema("nycflights13", "flights"))
## End(Not run)



