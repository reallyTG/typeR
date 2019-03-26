library(MonetDB.R)


### Name: monetdb.read.csv
### Title: Import a CSV file into MonetDB
### Aliases: monetdb.read.csv monet.read.csv
### Keywords: interface

### ** Examples

## Not run: 
##D library(DBI)
##D # connect to MonetDB
##D conn <- dbConnect(MonetDB.R::MonetDB(), dbname = "demo")
##D # write test data to temporary CSV file
##D file <- tempfile()
##D write.table(iris, file, sep=",")
##D # create table and import CSV
##D MonetDB.R::monetdb.read.csv(conn, file, "iris")
## End(Not run)


