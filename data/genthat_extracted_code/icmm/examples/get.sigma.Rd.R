library(icmm)


### Name: get.sigma
### Title: Standard deviation estimation.
### Aliases: get.sigma

### ** Examples

data(simGaussian)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
alpha<-0.5
# Obtain initial values from lasso
data(initbetaGaussian)
beta<-as.matrix(initbetaGaussian)
# Obtain sigma
sigma<-get.sigma(Y=Y, X=X, beta=beta, alpha=alpha)



