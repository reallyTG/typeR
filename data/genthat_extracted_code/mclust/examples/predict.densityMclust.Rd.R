library(mclust)


### Name: predict.densityMclust
### Title: Density estimate of multivariate observations by Gaussian finite
###   mixture modeling
### Aliases: predict.densityMclust
### Keywords: multivariate

### ** Examples

## Not run: 
##D x <- faithful$waiting
##D dens <- densityMclust(x)
##D x0 <- seq(50, 100, by = 10)
##D d0 <- predict(dens, x0)
##D plot(dens)
##D points(x0, d0, pch = 20)
## End(Not run)



