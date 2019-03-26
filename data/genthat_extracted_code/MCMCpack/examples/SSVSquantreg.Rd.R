library(MCMCpack)


### Name: SSVSquantreg
### Title: Stochastic search variable selection for quantile regression
### Aliases: SSVSquantreg
### Keywords: models

### ** Examples


## Not run: 
##D 
##D set.seed(1)
##D epsilon<-rnorm(100)
##D set.seed(2)
##D x<-matrix(rnorm(1000),100,10)
##D y<-x[,1]+x[,10]+epsilon
##D qrssvs<-SSVSquantreg(y~x)
##D model.50pc<-SSVSquantreg(y~x)
##D model.90pc<-SSVSquantreg(y~x,tau=0.9)
##D summary(model.50pc) ## Intercept not in median probability model
##D summary(model.90pc) ## Intercept appears in median probability model
## End(Not run)




