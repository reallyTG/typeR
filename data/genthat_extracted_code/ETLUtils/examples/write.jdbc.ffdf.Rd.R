library(ETLUtils)


### Name: write.jdbc.ffdf
### Title: Write ffdf data to a database table by using a JDBC connection.
### Aliases: write.jdbc.ffdf

### ** Examples

## Not run: 
##D require(ff)
##D 
##D ##
##D ## Example query using data in sqlite
##D ##
##D require(RJDBC)
##D dbfile <- system.file("smalldb.sqlite3", package="ETLUtils")
##D drv <- JDBC(driverClass = "org.sqlite.JDBC", classPath = "/usr/local/lib/sqlite-jdbc-3.7.2.jar")
##D query <- "select * from testdata limit 10000"
##D x <- read.jdbc.ffdf(query = query, 
##D  dbConnect.args = list(drv = drv, url = sprintf("jdbc:sqlite:%s", dbfile)), 
##D  first.rows = 100, next.rows = 1000, VERBOSE=TRUE)
##D  
##D write.jdbc.ffdf(x = x, name = "helloworld", row.names = FALSE, overwrite = TRUE,
##D   dbConnect.args = list(drv = drv, url = sprintf("jdbc:sqlite:%s", dbfile)), 
##D   by = 1000, VERBOSE=TRUE)
##D test <- read.jdbc.ffdf(query = "select * from helloworld", 
##D   dbConnect.args = list(drv = drv, url = sprintf("jdbc:sqlite:%s", dbfile)))
## End(Not run)



