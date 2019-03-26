library(PivotalR)


### Name: Aggregate functions
### Title: Functions to perform a calculation on multiple values and return
###   a single value
### Aliases: 'Aggregate functions' sd var count mean,db.obj-method
###   sum,db.obj-method count,db.obj-method max,db.obj-method
###   min,db.obj-method sd,db.obj-method var,db.obj-method
###   colMeans,db.obj-method colSums,db.obj-method colAgg db.array
### Keywords: math stats

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("mean,db.obj-method")
##D 
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## ----------------------------------------------------------------------
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D ## get the mean of a column
##D mean(x$diameter)
##D 
##D ## get the sum of a column
##D sum(x$height)
##D 
##D ## get the number of entries in a column
##D count(x$id)
##D 
##D ## get the max value of a column
##D max(x$diameter)
##D 
##D ## get the min value of a column
##D min(x$diameter)
##D 
##D ## get the standard deviation of the values in column
##D sd(x$diameter)
##D 
##D ## get the variance of the values in column
##D var(x$diameter)
##D 
##D ## get the mean of all columns in the table
##D colMeans(x)
##D 
##D ## get the sum of all columns in the table
##D colSums(x)
##D 
##D ## get the array aggregate of a specific column in the table
##D colAgg(x$diameter)
##D 
##D ## get the array aggregate of all columns in the table
##D colAgg(x)
##D 
##D ## put everything into an array plus a constant 1 as the first element
##D db.array(1, x[,3:5], x[,6:7], x[,8:10])
##D 
##D ## ----------------------------------------------------------------------
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



