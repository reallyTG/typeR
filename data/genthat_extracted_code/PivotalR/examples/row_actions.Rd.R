library(PivotalR)


### Name: Row_actions
### Title: Compute the sum or mean of all columns in one row of a table
### Aliases: rowSums,db.obj-method rowMeans,db.obj-method

### ** Examples
 ## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D lk(x, 10)
##D 
##D row.sum <- rowSums(x[,-2]) # the second column is text
##D row.avg <- rowMeans(x[,-2])
##D 
##D ## lokk at 10 results
##D lk(row.sum, 10)
##D lk(row.avg, 10)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



