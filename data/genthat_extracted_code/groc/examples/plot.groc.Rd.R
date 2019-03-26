library(groc)


### Name: plot.groc
### Title: Plot groc objects.
### Aliases: plot.groc
### Keywords: regresion multivariate

### ** Examples

## This example takes some time:
## Not run: 
##D data("pulpfiber",package="robustbase")
##D X <- as.matrix(pulpfiber[, 1:4])
##D Y <- as.matrix(pulpfiber[, 5:8])
##D data <- data.frame(X=I(X), Y=I(Y))
##D set.seed(55481)
##D out.rob <- groc(Y ~ X, data=data, plsrob=TRUE)
##D plot(out.rob, cex=.6)
## End(Not run)



