library(DatabaseConnector)


### Name: insertTable
### Title: Insert a table on the server
### Aliases: insertTable

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "mysql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v5")
##D conn <- connect(connectionDetails)
##D data <- data.frame(x = c(1, 2, 3), y = c("a", "b", "c"))
##D insertTable(conn, "my_table", data)
##D disconnect(conn)
##D 
##D ## bulk data insert with Redshift or PDW
##D connectionDetails <- createConnectionDetails(dbms = "redshift",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v5")
##D conn <- connect(connectionDetails)
##D data <- data.frame(x = c(1, 2, 3), y = c("a", "b", "c"))
##D insertTable(connection = connection,
##D             tableName = "scratch.somedata",
##D             data = data,
##D             dropTableIfExists = TRUE,
##D             createTable = TRUE,
##D             tempTable = FALSE,
##D             useMppBulkLoad = TRUE)  # or, Sys.setenv('USE_MPP_BULK_LOAD' = TRUE)
## End(Not run)



