library(RPresto)


### Name: src_presto
### Title: dplyr integration to connect to a Presto database.
### Aliases: src_presto tbl.src_presto

### ** Examples

## Not run: 
##D # To connect to a database
##D my_db <- src_presto(catalog = "hive", schema = "web", user = "onur",
##D   host = "localhost", port = 8888, session.timezone='Asia/Kathmandu')
## End(Not run)
## Not run: 
##D First create a database connection with src_presto, then reference a tbl
##D within that database
##D my_tbl <- tbl(my_db, "my_table")
## End(Not run)



