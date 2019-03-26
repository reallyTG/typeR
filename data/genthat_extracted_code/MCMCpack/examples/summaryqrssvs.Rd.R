library(MCMCpack)


### Name: summaryqrssvs
### Title: Summarising the results of quantile regression stochastic search
###   variable selection (QR-SSVS).
### Aliases: summaryqrssvs summary.qrssvs print.summary.qrssvs
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1)
##D epsilon<-rnorm(100)
##D set.seed(2)
##D x<-matrix(rnorm(1000),100,10)
##D y<-x[,1]+x[,10]+epsilon
##D qrssvs<-SSVSquantreg(y~x)
##D summary(qrssvs$gamma)
## End(Not run)




