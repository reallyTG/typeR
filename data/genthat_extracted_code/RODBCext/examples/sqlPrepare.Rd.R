library(RODBCext)


### Name: sqlPrepare
### Title: Prepares a query for execution
### Aliases: sqlPrepare

### ** Examples

## Not run: 
##D   conn = odbcConnect('MyDataSource')
##D   
##D   sqlPrepare(conn, "SELECT * FROM myTable WHERE column = ?")
##D   sqlExecute(conn, NULL, 'myValue')
##D   sqlFetchMore(conn)
##D   
##D   # with a query timeout
##D   sqlPrepare(conn, "SELECT * FROM myTable WHERE column = ?", query_timeout=60)
##D   sqlExecute(conn, data='myValue', fetch=TRUE)
## End(Not run)



