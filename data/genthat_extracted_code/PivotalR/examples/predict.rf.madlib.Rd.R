library(PivotalR)


### Name: predict.rf.madlib
### Title: Compute the predictions of the model produced by
###   madlib.randomForest
### Aliases: predict.rf.madlib
### Keywords: madlib stats math

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D key(x) <- "id"
##D fit <- madlib.randomForest(rings < 10 ~ length + diameter + height + whole + shell,
##D        data=x)
##D 
##D predict(fit, x, 'r')
##D 
##D db.disconnect(cid)
## End(Not run)



