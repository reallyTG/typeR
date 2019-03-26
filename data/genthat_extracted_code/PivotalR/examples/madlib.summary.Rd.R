library(PivotalR)


### Name: madlib.summary
### Title: Data summary function
### Aliases: madlib.summary summary,db.obj-method
### Keywords: stats madlib

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("madlib.summary")
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D x  <- db.data.frame("abalone", conn.id = cid, verbose = FALSE)
##D 
##D lk(x, 10)
##D 
##D # madlib.summary
##D summary_result  <- madlib.summary(x)
##D print(summary_result)
##D 
##D # madlib.summary
##D summary_result  <- madlib.summary(x, target.cols=c('rings', 'length', 'diameter'),
##D                                     grouping.cols=c('sex'),
##D                                     get.distinct=FALSE,
##D                                     get.quartiles=TRUE,
##D                                     ntile=c(0.1, 0.6),
##D                                     n.mfv=5,
##D                                     estimate=TRUE,
##D                                     interactive=FALSE)
##D 
##D print(summary_result)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



