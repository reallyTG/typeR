library(RMariaDB)


### Name: dbConnect,MariaDBDriver-method
### Title: Connect/disconnect to a MariaDB DBMS
### Aliases: dbConnect,MariaDBDriver-method MariaDB

### ** Examples

## Not run: 
##D # Connect to a MariaDB database running locally
##D con <- dbConnect(RMariaDB::MariaDB(), dbname = "mydb")
##D # Connect to a remote database with username and password
##D con <- dbConnect(RMariaDB::MariaDB(), host = "mydb.mycompany.com",
##D   user = "abc", password = "def")
##D # But instead of supplying the username and password in code, it's usually
##D # better to set up a group in your .my.cnf (usually located in your home
##D directory). Then it's less likely you'll inadvertently share them.
##D con <- dbConnect(RMariaDB::MariaDB(), group = "test")
##D 
##D # Always cleanup by disconnecting the database
##D dbDisconnect(con)
## End(Not run)

# All examples use the rs-dbi group by default.
if (mariadbHasDefault()) {
  con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
  con
  dbDisconnect(con)
}
if (mariadbHasDefault()) {
# connect to a database and load some data
con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
dbWriteTable(con, "USArrests", datasets::USArrests, temporary = TRUE)

# query
rs <- dbSendQuery(con, "SELECT * FROM USArrests")
d1 <- dbFetch(rs, n = 10)      # extract data in chunks of 10 rows
dbHasCompleted(rs)
d2 <- dbFetch(rs, n = -1)      # extract all remaining data
dbHasCompleted(rs)
dbClearResult(rs)
dbListTables(con)

# clean up
dbDisconnect(con)
}



