library(spikeslab)


### Name: cv.spikeslab
### Title: K-fold Cross-Validation for Spike and Slab Regression
### Aliases: cv.spikeslab
### Keywords: regression

### ** Examples

## Not run: 
##D #------------------------------------------------------------
##D # Example 1: 10-fold validation using parallel processing
##D #------------------------------------------------------------
##D 
##D data(ozoneI, package = "spikeslab")
##D y <- ozoneI[,  1]
##D x <- ozoneI[, -1]
##D cv.obj <- cv.spikeslab(x = x, y = y, parallel = 4)
##D plot(cv.obj, plot.type = "cv")
##D plot(cv.obj, plot.type = "path")
##D 
##D #------------------------------------------------------------
##D # Example 2: 10-fold validation using parallel processing
##D # (high dimensional diabetes data)
##D #------------------------------------------------------------
##D 
##D # add 2000 noise variables
##D data(diabetesI, package = "spikeslab")
##D diabetes.noise <- cbind(diabetesI,
##D       noise = matrix(rnorm(nrow(diabetesI) * 2000), nrow(diabetesI)))
##D x <- diabetes.noise[, -1]
##D y <- diabetes.noise[, 1]
##D 
##D cv.obj <- cv.spikeslab(x = x, y = y, bigp.smalln=TRUE, parallel = 4)
##D plot(cv.obj)
## End(Not run)



