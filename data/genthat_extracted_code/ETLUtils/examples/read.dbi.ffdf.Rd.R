library(ETLUtils)


### Name: read.dbi.ffdf
### Title: Read data from a DBI connection into an ffdf.
### Aliases: read.dbi.ffdf

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
class(x)
x[1:10, ]

## show it is the same as getting the data directly using RSQLite 
## apart from characters which are factors in ffdf objects
directly <- dbGetQuery(dbConnect(drv = drv, dbname = dbfile), query)
directly <- as.data.frame(as.list(directly), stringsAsFactors=TRUE)
all.equal(x[,], directly)

## show how to use the transFUN argument to transform the data before saving into the ffdf
## and shows the use of the levels argument
query <- "select * from testdata limit 10"
x <- read.dbi.ffdf(query = query, dbConnect.args = list(drv = drv, dbname = dbfile), 
first.rows = 100, next.rows = 1000, VERBOSE=TRUE, levels = list(a = rev(LETTERS)),
transFUN = function(x, subtractdays){
	x$b <- as.Date(x$b)
	x$b.subtractdaysago <- x$b - subtractdays
	x
}, subtractdays=7)
class(x)
x[1:10, ]
## remark that the levels of column a are reversed due to specifying the levels argument correctly
levels(x$a)

## show how to append data to an existing ffdf object 
transformexample <- function(x, subtractdays){
	x$b <- as.Date(x$b)
	x$b.subtractdaysago <- x$b - subtractdays
	x
}
dim(x)
x[,]
combined <- read.dbi.ffdf(query = query, 
 dbConnect.args = list(drv = drv, dbname = dbfile), 
 first.rows = 100, next.rows = 1000, x = x, VERBOSE=TRUE, 
 transFUN = transformexample, subtractdays=1000)
dim(combined)
combined[,]

##
## Example query using ROracle. Do try this at home with some larger data :)
##
## Not run: 
##D require(ROracle)
##D query <- "select OWNER, TABLE_NAME, TABLESPACE_NAME, NUM_ROWS, LAST_ANALYZED from all_all_tables" 
##D x <- read.dbi.ffdf(query=query,
##D dbConnect.args = list(drv = dbDriver("Oracle"), 
##D user = "YourUser", password = "YourPassword", dbname = "Mydatabase"),
##D first.rows = 100, next.rows = 50000, nrows = -1, VERBOSE=TRUE)
## End(Not run)



