library(PivotalR)


### Name: madlib.elnet
### Title: MADlib's elastic net regularization for generalized linear
###   models
### Aliases: madlib.elnet
### Keywords: madlib stats

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- matrix(rnorm(100*20),100,20)
##D y <- rnorm(100, 0.1, 2)
##D 
##D dat <- data.frame(x, y)
##D 
##D delete("eldata")
##D z <- as.db.data.frame(dat, "eldata", conn.id = cid, verbose = FALSE)
##D 
##D fit <- madlib.elnet(y ~ ., data = z, alpha = 0.2, lambda = 0.05, control
##D = list(random.stepsize=TRUE))
##D 
##D fit
##D 
##D lk(mean((z$y - predict(fit, z))^2)) # mean square error
##D 
##D fit <- madlib.elnet(y ~ ., data = z, alpha = 0.2, lambda = 0.05, method = "cd")
##D 
##D fit
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



