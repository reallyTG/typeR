library(MCMCpack)


### Name: mptable
### Title: Calculate the marginal posterior probabilities of predictors
###   being included in a quantile regression model.
### Aliases: mptable
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1)
##D epsilon<-rnorm(100)
##D set.seed(2)
##D x<-matrix(rnorm(1000),100,10)
##D y<-x[,1]+x[,10]+epsilon
##D qrssvs<-SSVSquantreg(y~x)
##D mptable(qrssvs$gamma)
## End(Not run)




