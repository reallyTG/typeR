library(icmm)


### Name: get.wpost
### Title: Estimate posterior probability of mixing weight.
### Aliases: get.wpost

### ** Examples

data(simGaussian)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
n<-dim(X)[1]
data(linearrelation)
edgeind<-sort(unique(linearrelation[,1]))
# Obtain initial values from lasso
data(initbetaGaussian)
beta<-as.matrix(initbetaGaussian)
# Initiate all other parameters
alpha<-0.5
sigma<-get.sigma(Y=Y, X=X, beta=beta, alpha=alpha)
hyperparam<-get.ab(beta, linearrelation, edgeind)
# Estimate the posterior probability of first predictor
j<-1
Yres<-Y-X%*%beta+X[,j]*beta[j,1]
sxy<-t(Yres)%*%X[,j]
ssx<-sum(X[,j]^2)
SS<-sqrt(n-1)*sxy/(sigma*ssx)
wpost<-get.wpost(SS=SS, beta=beta, alpha=alpha, hyperparam=hyperparam, 
       structure=linearrelation, edgeind=edgeind, j=j)



