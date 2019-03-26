library(CensMixReg)


### Name: concentration
### Title: Concentration levels
### Aliases: concentration
### Keywords: datasets

### ** Examples

## Not run: 
##D data(concentration)
##D p  <- 5
##D y  <- as.matrix(concentration[,1:p])
##D cc <- as.matrix(concentration[,(p+1):(2*p)])
##D 
##D fitN <- CensMmix(cc, y, nu=3, mu=NULL, Sigma = NULL,  pii = NULL, g = 2,
##D                   get.init = TRUE, criteria = TRUE, group = TRUE,
##D                   family = "Normal", error = 0.00001, iter.max = 350,
##D                   uni.Sigma = TRUE, obs.prob= FALSE, kmeans.param = NULL)
##D 
##D #Standard error (SE)
##D fitN$res$SE
## End(Not run)



