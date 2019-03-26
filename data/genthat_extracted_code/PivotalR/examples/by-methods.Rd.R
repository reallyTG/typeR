library(PivotalR)


### Name: by
### Title: Apply a Function to a 'db.data.frame' Split by column(s)
### Aliases: by,db.obj-method
### Keywords: methods data operation

### ** Examples

## Not run: 
##D ## help("by,db.obj-method") # display this doc
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## mean values for each column
##D lk(by(x, x$sex, mean))
##D 
##D ## No need to compute the mean of id and sex
##D lk(by(x[,-c(1,2)], x$sex, mean))
##D lk(by(x[,-c(1,2)], x[,2], mean)) # the same
##D lk(by(x[,-c(1,2)], x[,"sex"], mean)) # the same
##D 
##D ## The return type of FUN is not db.obj
##D dat <- x
##D 
##D ## Fit linear model to each group of data
##D by(dat, dat$sex, function(x) madlib.lm(rings ~ . - id - sex, data = x))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



