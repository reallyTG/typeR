library(PivotalR)


### Name: predict.dt.madlib
### Title: Compute the predictions of the model produced by madlib.rpart
### Aliases: predict.dt.madlib
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
##D fit <- madlib.rpart(rings < 10 ~ length + diameter + height + whole + shell,
##D        data=x, parms = list(split='gini'), control = list(cp=0.005))
##D 
##D predict(fit, x, 'r')
##D 
##D db.disconnect(cid)
## End(Not run)



