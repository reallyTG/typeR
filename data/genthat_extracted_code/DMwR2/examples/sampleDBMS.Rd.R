library(DMwR2)


### Name: sampleDBMS
### Title: Drawing a random sample of records of a table stored in a DBMS
### Aliases: sampleDBMS
### Keywords: models

### ** Examples

## A simple example over a table on a MySQL database
## Not run: 
##D library(DBI)
##D library(RMySQL)
##D drv <- dbDriver("MySQL")  # Loading the MySQL driver
##D con <- dbConnect(drv,dbname="myDB",  
##D                  username="myUSER",password="myPASS",
##D                  host="localhost")
##D d <- sampleDBMS(con,"largeTable",10000)
## End(Not run)



