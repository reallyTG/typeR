library(RMySQL)


### Name: dbConnect,MySQLDriver-method
### Title: Connect/disconnect to a MySQL DBMS
### Aliases: dbConnect,MySQLConnection-method dbConnect,MySQLDriver-method
###   dbDisconnect,MySQLConnection-method

### ** Examples

## Not run: 
##D # Connect to a MySQL database running locally
##D con <- dbConnect(RMySQL::MySQL(), dbname = "mydb")
##D # Connect to a remote database with username and password
##D con <- dbConnect(RMySQL::MySQL(), host = "mydb.mycompany.com",
##D   user = "abc", password = "def")
##D # But instead of supplying the username and password in code, it's usually
##D # better to set up a group in your .my.cnf (usually located in your home
##D directory). Then it's less likely you'll inadvertently share them.
##D con <- dbConnect(RMySQL::MySQL(), group = "test")
##D 
##D # Always cleanup by disconnecting the database
##D dbDisconnect(con)
## End(Not run)

# All examples use the rs-dbi group by default.
if (mysqlHasDefault()) {
  con <- dbConnect(RMySQL::MySQL(), dbname = "test")
  summary(con)
  dbDisconnect(con)
}



