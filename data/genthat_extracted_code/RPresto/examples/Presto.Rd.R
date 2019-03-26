library(RPresto)


### Name: Presto
### Title: Connect to a Presto database
### Aliases: Presto dbConnect,PrestoDriver-method
###   dbDisconnect,PrestoConnection-method

### ** Examples

## Not run: 
##D   conn <- dbConnect(Presto(), catalog = 'hive', schema = 'default',
##D                     user = 'onur', host = 'localhost', port = 8080,
##D                     session.timezone='US/Eastern')
##D   dbListTables(conn, '%_iris')
##D   dbDisconnect(conn)
## End(Not run)



