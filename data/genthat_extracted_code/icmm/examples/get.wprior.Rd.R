library(icmm)


### Name: get.wprior
### Title: Mixing weight estimation.
### Aliases: get.wprior

### ** Examples

data(simGaussian)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
# Obtain initial values from lasso
data(initbetaGaussian)
beta<-as.matrix(initbetaGaussian)
# Estimate the mixing weight
w<-get.wprior(beta)



