library(BiodiversityR)


### Name: nnetrandom
### Title: Calculate the NNET Result with the Smallest Value from Various
###   Random Starts
### Aliases: nnetrandom
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(faramea)
##D faramea <- na.omit(faramea)
##D faramea$presence <- as.numeric(faramea$Faramea.occidentalis > 0)
##D attach(faramea)
##D library(nnet)
##D result <- nnetrandom(presence ~ Elevation, data=faramea, size=2, 
##D     skip=FALSE, entropy=TRUE, trace=FALSE, maxit=1000, tries=100, 
##D     leave.one.out=FALSE)
##D summary(result)
##D result$fitted.values
##D result$value
##D result2 <- nnetrandom(presence ~ Elevation, data=faramea, size=2, 
##D     skip=FALSE, entropy=TRUE, trace=FALSE, maxit=1000, tries=50, 
##D     leave.one.out=TRUE)
##D result2$range
##D result2$CV
##D result2$successful
## End(Not run)



