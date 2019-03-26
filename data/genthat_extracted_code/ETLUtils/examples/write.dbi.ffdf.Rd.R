library(ETLUtils)


### Name: write.dbi.ffdf
### Title: Write ffdf data to a database table by using a DBI connection.
### Aliases: write.dbi.ffdf

### ** Examples

require(ff)

##
## Example query using data in sqlite
##
require(RSQLite)
dbfile <- system.file("smalldb.sqlite3", package="ETLUtils")
drv <- dbDriver("SQLite")
query <- "select * from testdata limit 10000"
x <- read.dbi.ffdf(query = query, dbConnect.args = list(drv = drv, dbname = dbfile), 
first.rows = 100, next.rows = 1000, VERBOSE=TRUE)

## copy db in package folder to temp folder as CRAN does not allow writing in package dirs
dbfile <- tempfile(fileext = ".sqlite3")
file.copy(from = system.file("smalldb.sqlite3", package="ETLUtils"), to = dbfile)
Sys.chmod(dbfile, mode = "777")
write.dbi.ffdf(x = x, name = "helloworld", row.names = FALSE, overwrite = TRUE,
  dbConnect.args = list(drv = drv, dbname = dbfile), 
  by = 1000, VERBOSE=TRUE)
test <- read.dbi.ffdf(query = "select * from helloworld", 
  dbConnect.args = list(drv = drv, dbname = dbfile))

## clean up for CRAN
file.remove(dbfile)
## Not run: 
##D require(ROracle)
##D write.dbi.ffdf(x = x, name = "hellooracle", row.names = FALSE, overwrite = TRUE,
##D   dbConnect.args = list(drv = dbDriver("Oracle"), 
##D                         user = "YourUser", password = "YourPassword", dbname = "Mydatabase"), 
##D   VERBOSE=TRUE)
## End(Not run)



