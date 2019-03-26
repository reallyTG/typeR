library(iRF)


### Name: rfcv
### Title: Random Forest Cross-Valdidation for feature selection
### Aliases: rfcv
### Keywords: classif regression

### ** Examples

set.seed(647)
myiris <- cbind(iris[1:4], matrix(runif(96 * nrow(iris)), nrow(iris), 96))
result <- rfcv(myiris, iris$Species, cv.fold=3)
with(result, plot(n.var, error.cv, log="x", type="o", lwd=2))

## The following can take a while to run, so if you really want to try
## it, copy and paste the code into R.

## Not run: 
##D result <- replicate(5, rfcv(myiris, iris$Species), simplify=FALSE)
##D error.cv <- sapply(result, "[[", "error.cv")
##D matplot(result[[1]]$n.var, cbind(rowMeans(error.cv), error.cv), type="l",
##D         lwd=c(2, rep(1, ncol(error.cv))), col=1, lty=1, log="x",
##D         xlab="Number of variables", ylab="CV Error")
## End(Not run)



