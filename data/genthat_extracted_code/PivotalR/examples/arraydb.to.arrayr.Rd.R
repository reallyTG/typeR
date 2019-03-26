library(PivotalR)


### Name: arraydb.to.arrayr
### Title: Convert strings extracted from database into arrays
### Aliases: arraydb.to.arrayr
### Keywords: database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## Example 1 ----------
##D 
##D str <- '{1.2, 3.4, 5.6}'
##D arraydb.to.arrayr(str, "double") # c(1.2, 3.4, 5.6)
##D 
##D str <- '{a, b, "c, d"}'
##D arraydb.to.arrayr(str, "character") # c("a", "b", "\"c, d\"")
##D 
##D ## Example 2 ----------
##D 
##D ## table_in_database has a column of arrays
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D x$col.array <- db.array(x[,3:10])
##D dat <- lk(x, nrows = 50, array = FALSE) # extract the actual data
##D arraydb.to.arrayr(dat$col.array, "double") # an array of 50 rows
##D 
##D ## ----------------------------------------------------------------------
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



