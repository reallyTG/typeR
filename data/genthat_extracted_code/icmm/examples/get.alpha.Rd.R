library(icmm)


### Name: get.alpha
### Title: Hyperparameter estimation for 'alpha'.
### Aliases: get.alpha

### ** Examples

data(simGaussian)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
n<-dim(X)[1]
# Obtain initial values of beta from lasso
data(initbetaGaussian)
beta<-as.matrix(initbetaGaussian)
# Initiate alpha
alpha<-0.5
# Estimate sigma
e<-Y-X%*%beta
nz<-sum(beta[,1]!=0)
sigma<-get.sigma(Y=Y, X=X, beta=beta, alpha=alpha)
# Update alpha as the mode of its full conditional distribution function
alpha<-get.alpha(beta=beta, scaledfactor=1/(sqrt(n-1)*sum(abs(beta))/sigma))



