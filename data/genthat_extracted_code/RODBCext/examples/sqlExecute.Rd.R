library(RODBCext)


### Name: sqlExecute
### Title: Executes an already prepared query
### Aliases: sqlExecute

### ** Examples

## Not run: 
##D   conn = odbcConnect('MyDataSource')
##D   
##D   # prepare, execute and fetch results separatly
##D   sqlPrepare(conn, "SELECT * FROM myTable WHERE column = ?")
##D   sqlExecute(conn, NULL, 'myValue')
##D   sqlGetResults(conn)
##D   
##D   # prepare and execute at one time, fetch results separately
##D   sqlExecute(conn, "SELECT * FROM myTable WHERE column = ?", 'myValue')
##D   sqlGetResults(conn)
##D   
##D   # prepare, execute and fetch at one time
##D   sqlExecute(conn, "SELECT * FROM myTable WHERE column = ?", 'myValue', TRUE)
##D   
##D   # prepare, execute and fetch at one time, pass additional parameters to sqlFetch()
##D   sqlExecute(
##D     conn, 
##D     "SELECT * FROM myTable WHERE column = ?", 
##D     'myValue', 
##D     TRUE, 
##D     stringsAsFactors=FALSE
##D   )
##D   
##D   # prepare, execute and fetch at one time using a query timeout value
##D   sqlExecute(conn, "SELECT * FROM myTable WHERE column = ?", 'myValue', TRUE, query_timeout=45)
##D   
##D   # execute a simple statement without parameters using a query timeout value
##D   sqlExecute(con, "SELECT * FROM myTable", fetch = TRUE, query_timeout = 60)
## End(Not run)



