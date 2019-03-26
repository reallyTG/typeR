library(RODBCext)


### Name: odbcSetQueryTimeout
### Title: Sets the query timeout of a prepared query
### Aliases: odbcSetQueryTimeout

### ** Examples

## Not run: 
##D   conn = odbcConnect('MyDataSource')
##D   
##D   sqlPrepare(conn, "SELECT * FROM myTable WHERE column = ?")
##D   odbcSetQueryTimeout(conn, 120)   # sets the query timeout of the prepared statement
##D   sqlExecute(conn, 'myValue')
##D   sqlFetchMore(conn)
## End(Not run)




