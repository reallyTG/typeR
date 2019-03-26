library(sergeant)


### Name: drill_jdbc
### Title: Connect to Drill using JDBC
### Aliases: drill_jdbc

### ** Examples

## Not run: 
##D con <- drill_jdbc("localhost:2181", "main")
##D drill_query(con, "SELECT * FROM cp.`employee.json`")
##D 
##D # you can also use the connection with RJDBC calls:
##D dbGetQuery(con, "SELECT * FROM cp.`employee.json`")
##D 
##D # for local/embedded mode with default configuration info
##D con <- drill_jdbc("localhost:31010", use_zk=FALSE)
## End(Not run)



