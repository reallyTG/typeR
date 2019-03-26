library(RRF)


### Name: rrfcv
### Title: Random Forest Cross-Valdidation for feature selection
### Aliases: rrfcv
### Keywords: classif regression

### ** Examples



## The following can take a while to run, so if you really want to try
## it, copy and paste the code into R.

## Not run: 
##D set.seed(647)
##D myiris <- cbind(iris[1:4], matrix(runif(508 * nrow(iris)), nrow(iris), 508))
##D result <- rrfcv(myiris, iris$Species)
##D with(result, plot(n.var, error.cv, log="x", type="o", lwd=2))
##D 
##D result <- replicate(5, rrfcv(myiris, iris$Species), simplify=FALSE)
##D error.cv <- sapply(result, "[[", "error.cv")
##D matplot(result[[1]]$n.var, cbind(rowMeans(error.cv), error.cv), type="l",
##D         lwd=c(2, rep(1, ncol(error.cv))), col=1, lty=1, log="x",
##D         xlab="Number of variables", ylab="CV Error")
## End(Not run)



