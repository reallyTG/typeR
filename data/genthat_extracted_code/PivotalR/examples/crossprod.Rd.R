library(PivotalR)


### Name: crossprod
### Title: Compute the matrix product of 'X^T' and 'Y'.
### Aliases: crossprod crossprod,db.obj,ANY-method
### Keywords: methods math

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("crossprod,db.obj-method")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D lookat(crossprod(x[,-c(1,2)]))
##D 
##D x$arr <- db.array(1, x$length, x$diameter)
##D 
##D lookat(crossprod(x$arr))
##D 
##D ## -----------------------------------------------------
##D 
##D ## Create a function that does Principal Component Analysis in parallel.
##D ## As long as the number of features of the data table is fewer than
##D ## ~ 5000, the matrix t(x) ##D 
##D ## the eigenvalues and eigenvectors. However, the step t(x) ##D 
##D ## be done in-database in parallel, because x can be very big.
##D pca <- function (x, center = TRUE, scale = FALSE)
##D {
##D     y <- scale(x, center = center, scale = scale) # centering and scaling
##D     z <- as.db.data.frame(y, verbose = FALSE) # create an intermediate table to save computation
##D     m <- lookat(crossprod(z)) # one scan of the table to compute Z^T * Z
##D     d <- delete(z) # delete the intermediate table
##D     res <- eigen(m) # only this computation is in R
##D     n <- attr(y, "row.number") # save the computation to count rows
##D 
##D     ## return the result
##D     list(val = sqrt(res$values/(n-1)), # eigenvalues
##D          vec = res$vectors, # columns of this matrix are eigenvectors
##D          center = attr(y, "scaled:center"),
##D          scale = attr(y, "scaled:scale"))
##D }
##D 
##D ## create a data table with a random name
##D dat <- db.data.frame("abalone", conn.id = cid, verbose = FALSE)
##D 
##D ## exclude id and sex columns
##D p <- pca(dat[,-c(1,2)])
##D 
##D p$val # eigenvalues
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



