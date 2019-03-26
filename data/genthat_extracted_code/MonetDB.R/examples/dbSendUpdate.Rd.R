library(MonetDB.R)


### Name: dbSendUpdate
### Title: Send a data-altering SQL statement to the database.
### Aliases: dbSendUpdate dbSendUpdateAsync
###   dbSendUpdate,MonetDBConnection,character-method
###   dbSendUpdateAsync,MonetDBConnection,character-method
### Keywords: interface

### ** Examples

## Not run: 
##D # connect to MonetDB
##D conn <- dbConnect(MonetDB.R(), "monetdb://localhost/acs")
##D # create table
##D dbSendUpdate(conn, "CREATE TABLE foo(a INT,b VARCHAR(100))")
##D # insert value, bind parameters to placeholders in statement
##D dbSendUpdate(conn, "INSERT INTO foo VALUES(?,?)", 42, "bar")
##D 
## End(Not run)


