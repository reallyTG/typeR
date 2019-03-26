library(PivotalR)


### Name: generic.bagging
### Title: This function runs boostrap aggregating for a given training
###   function.
### Aliases: generic.bagging
### Keywords: math stats

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D y <- db.data.frame("abalone", conn.id = cid)
##D 
##D fit <- generic.bagging(function(data) {
##D                            madlib.lm(rings ~ . - id - sex, data = data)
##D                        }, data = y, nbags = 25, fraction = 0.7)
##D 
##D pred <- predict(fit, newdata = y) # make prediction
##D 
##D lookat(mean((y$rings - pred)^2)) # mean squared error
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



