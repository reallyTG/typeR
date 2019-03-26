library(PivotalR)


### Name: as.db.data.frame
### Title: Convert other objects into a 'db.data.frame' object
### Aliases: as.db.data.frame as.db.data.frame,character-method
###   as.db.data.frame,data.frame-method as.db.data.frame,db.Rquery-method
###   as.db.data.frame,db.data.frame-method as.db.Rview
### Keywords: utility database methods

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("as.db.data.frame")
##D ## help("as.db.data.frame,db.Rquery-method")
##D 
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
##D y <- (x[,-2] + 1.2) * 2
##D lk(y, 20, FALSE)
##D 
##D ## table abalone has a column named "id"
##D lk(sort(x, INDICES = x$id), 20) # the preview is ordered by "id" value
##D 
##D ## create a copied table
##D ## x[,] converts x from db.data.frame object to db.Rquery object
##D z <- as.db.data.frame(x[,])
##D 
##D ## Force the data type, use random table name
##D 
##D z1 <- as.db.data.frame(x$rings, field.types = list(rings="integer"))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run) 


