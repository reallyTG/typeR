library(MCMCpack)


### Name: topmodels
### Title: Shows an ordered list of the most frequently visited models
###   sampled during quantile regression stochastic search variable
###   selection (QR-SSVS).
### Aliases: topmodels
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1)
##D epsilon<-rnorm(100)
##D set.seed(2)
##D x<-matrix(rnorm(1000),100,10)
##D y<-x[,1]+x[,10]+epsilon
##D qrssvs<-SSVSquantreg(y~x)
##D topmodels(qrssvs$gamma)
## End(Not run)




