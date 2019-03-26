library(PivotalR)


### Name: generic.cv
### Title: Generic cross-validation for supervised learning algorithms
### Aliases: generic.cv
### Keywords: stats math

### ** Examples

## Not run: 
##D 
##D 
##D 
##D ## set up the database connection
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## ----------------------------------------------------------------------
##D 
##D dat <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D err <- generic.cv(     function(data) {
##D         madlib.lm(rings ~ . - id - sex, data = data)
##D     },
##D     predict,
##D     function(predicted, data) {
##D         lookat(mean((data$rings - predicted)^2))
##D     }, data = dat, verbose = FALSE)
##D 
##D ## ----------------------------------------------------------------------
##D 
##D x <- matrix(rnorm(100*20),100,20)
##D y <- rnorm(100, 0.1, 2)
##D 
##D dat <- data.frame(x, y)
##D delete("eldata", conn.id = cid)
##D z <- as.db.data.frame(dat, "eldata", conn.id = cid, verbose = FALSE)
##D 
##D g <- generic.cv(
##D     train = function (data, alpha, lambda) {
##D         madlib.elnet(y ~ ., data = data, family = "gaussian",
##D         alpha = alpha, lambda = lambda,
##D         control = list(random.stepsize=TRUE))
##D     },
##D     predict = predict,
##D     metric = function (predicted, data) {
##D         lk(mean((data$y - predicted)^2))
##D     },
##D     data = z,
##D     params = list(alpha=1, lambda=seq(0,0.2,0.1)),
##D     k = 5, find.min = TRUE, verbose = FALSE)
##D 
##D plot(g$params$lambda, g$metric$avg, type = 'b')
##D 
##D g$best
##D 
##D ## ----------------------------------------------------------------------
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



