library(RODBCext)


### Name: odbcGetQueryTimeout
### Title: Gets the current query timeout of a prepared query
### Aliases: odbcGetQueryTimeout

### ** Examples

## Not run: 
##D   conn = odbcConnect('MyDataSource')
##D   
##D   sqlPrepare(conn, "SELECT * FROM myTable WHERE column = ?")
##D   odbcGetQueryTimeout(conn)   # shows the current query timeout of the prepared statement
##D   sqlExecute(conn, 'myValue')
##D   sqlFetchMore(conn)
## End(Not run)



