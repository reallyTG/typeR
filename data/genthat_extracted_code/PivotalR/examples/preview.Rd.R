library(PivotalR)


### Name: preview
### Title: Read the actual data stored in a table of database.
### Aliases: lk lookat as.data.frame.db.table as.data.frame.db.view
###   as.data.frame.db.Rquery
### Keywords: methods data operation database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## preview of a table
##D lk(x, nrows = 10) # extract 10 rows of data
##D 
##D ## do some operations and preview the result
##D y <- (x[,1:2] + 1.2) * 2
##D lk(y, 20)
##D 
##D ## table abalone has a column named "id"
##D lk(sort(x, INDICES = x$id), 20) # the preview is ordered by "id" value
##D 
##D ## use as.data.frame
##D as.data.frame(x, 10)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



