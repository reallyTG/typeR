library(MonetDB.R)


### Name: dbTransaction
### Title: Create, commit or abort a database transaction.
### Aliases: dbTransaction dbTransaction,MonetDBConnection-method
###   dbCommit,MonetDBConnection-method dbRollback,MonetDBConnection-method

### ** Examples

## Not run: 
##D conn <- dbConnect(MonetDB.R(), "monetdb://localhost/acs")
##D dbSendUpdate(conn, "CREATE TABLE foo(a INT,b VARCHAR(100))")
##D dbTransaction(conn)
##D dbSendUpdate(conn, "INSERT INTO foo VALUES(?,?)", 42, "bar")
##D dbCommit(conn)
##D dbTransaction(conn)
##D dbSendUpdate(conn, "INSERT INTO foo VALUES(?,?)", 43, "bar")
##D dbRollback(conn)
##D 
##D # only 42 will be in table foo
## End(Not run)


