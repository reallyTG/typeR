library(ETLUtils)


### Name: read.jdbc.ffdf
### Title: Read data from a JDBC connection into an ffdf.
### Aliases: read.jdbc.ffdf

### ** Examples

## Not run: 
##D require(ff)
##D 
##D ##
##D ## Example query using data in sqlite
##D ##
##D require(RSQLite)
##D dbfile <- system.file("smalldb.sqlite3", package="ETLUtils")
##D drv <- JDBC(driverClass = "org.sqlite.JDBC", classPath = "/usr/local/lib/sqlite-jdbc-3.7.2.jar")
##D query <- "select * from testdata limit 10000"
##D x <- read.jdbc.ffdf(query = query, 
##D  dbConnect.args = list(drv = drv, url = sprintf("jdbc:sqlite:%s", dbfile)), 
##D  first.rows = 100, next.rows = 1000, VERBOSE=TRUE)
##D class(x)
##D x[1:10, ]
## End(Not run)



