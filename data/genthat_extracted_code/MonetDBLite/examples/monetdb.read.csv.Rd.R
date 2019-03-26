library(MonetDBLite)


### Name: monetdb.read.csv
### Title: Import a CSV file into MonetDBLite
### Aliases: monetdb.read.csv monet.read.csv
### Keywords: interface

### ** Examples


# initiate a MonetDBLite server
library(DBI)
dbdir <- file.path( tempdir() , 'readcsv' )
con <- dbConnect( MonetDBLite::MonetDBLite() , dbdir )

# write test data to temporary CSV file
file <- tempfile()
write.table(iris, file, sep=",", row.names=FALSE)

# create table and import CSV
monetdb.read.csv(con, file, "iris")

dbDisconnect(con, shutdown=TRUE)



