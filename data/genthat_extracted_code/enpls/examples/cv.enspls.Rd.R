library(enpls)


### Name: cv.enspls
### Title: Cross Validation for Ensemble Sparse Partial Least Squares
###   Regression
### Aliases: cv.enspls

### ** Examples

# This example takes one minute to run
## Not run: 
##D data("logd1k")
##D x = logd1k$x
##D y = logd1k$y
##D 
##D set.seed(42)
##D cvfit = cv.enspls(x, y, reptimes = 10)
##D print(cvfit)
##D plot(cvfit)
## End(Not run)



