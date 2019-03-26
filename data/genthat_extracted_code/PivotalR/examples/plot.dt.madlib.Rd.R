library(PivotalR)


### Name: plot.dt.madlib
### Title: Plot the result of madlib.rpart
### Aliases: plot.dt.madlib
### Keywords: ~kwd1 ~kwd2

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
##D ## decision tree using abalone data, using default values of minsplit,
##D ## maxdepth etc.
##D key(x)<-"id"
##D fit <- madlib.rpart(rings < 10 ~ length + diameter + height + whole + shell,
##D        data=x, parms = list(split='gini'), control = list(cp=0.005))
##D fit
##D 
##D plot(fit, uniform =TRUE)
##D text(fit)
##D 
##D db.disconnect(cid)
## End(Not run)



