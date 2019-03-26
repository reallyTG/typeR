library(rAverage)


### Name: rav.indices
### Title: Fit indices for averaging models
### Aliases: rav.indices
### Keywords: misc

### ** Examples
## Not run: 
##D data(fmdata1)
##D s <- c(12.9, 1.5, 18.3, 5.2, 5.0, 2.3)
##D w <- c(1.4, 0.3, 0.5, 1.6, 1.7, 1.7)
##D param <- c(NA,NA, s, w)
##D # Estimated model by rav:
##D fit1 <- rav(fmdata1, lev=c(3,3)) ; fit1
##D # Fitted model by original parameters:
##D fit2 <- rav.indices(param=param, lev=c(3,3), data=fmdata1) ; fit2
## End(Not run)


