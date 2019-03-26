library(icmm)


### Name: get.ab
### Title: Hyperparameter estimation for 'a' and 'b'.
### Aliases: get.ab

### ** Examples

data(simGaussian)
data(linearrelation)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
# Suppose obtain beta from lasso
data(initbetaGaussian)
beta<-as.matrix(initbetaGaussian)
edgeind<-sort(unique(linearrelation[,1]))
hyperparameter<-get.ab(beta=beta, structure=linearrelation, edgeind=edgeind)



