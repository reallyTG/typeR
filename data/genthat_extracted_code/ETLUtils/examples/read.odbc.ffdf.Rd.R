library(ETLUtils)


### Name: read.odbc.ffdf
### Title: Read data from a ODBC connection into an ffdf.
### Aliases: read.odbc.ffdf

### ** Examples

##
## Using the sqlite database (smalldb.sqlite3) in the /inst folder of the package
## set up the sqlite ODBC driver (www.stats.ox.ac.uk/pub/bdr/RODBC-manual.pd) 
## and call it 'smalltestsqlitedb' 
##
## Not run: 
##D require(RODBC)
##D x <- read.odbc.ffdf(
##D query = "select * from testdata limit 10000",
##D odbcConnect.args = list(
##D  dsn="smalltestsqlitedb", uid = "", pwd = "", 
##D  believeNRows = FALSE, rows_at_time = 1), 
##D nrows = -1, 
##D first.rows = 100, next.rows = 1000, VERBOSE = TRUE)
## End(Not run)



