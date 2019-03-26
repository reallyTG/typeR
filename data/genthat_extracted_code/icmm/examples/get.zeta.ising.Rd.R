library(icmm)


### Name: get.zeta.ising
### Title: Local posterior probability estimation.
### Aliases: get.zeta.ising

### ** Examples

data(simGaussian)
data(linearrelation)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
n<-dim(X)[1]
# Obtain initial values from lasso
data(initbetaGaussian)
initbeta<-as.matrix(initbetaGaussian)
# Get final output from ebvs
output<-icmm(Y, X, b0.start=0, b.start=initbeta, family = "gaussian", 
        ising.prior = TRUE, structure=linearrelation, estalpha = FALSE, 
        alpha = 0.5, maxiter = 100)
b0<-output$coef[1]
beta<-matrix(output$coef[-1], ncol=1)
# Get all parameters for function arguments
w<-get.wprior(beta)
alpha<-0.5
sigma<-get.sigma(Y,X,beta,alpha)
edgeind<-sort(unique(linearrelation[,1]))
hyperparam<-get.ab(beta, linearrelation, edgeind)
# Estimate local posterior probability
j<-1
Yres<-Y-b0-X%*%beta+X[,j]*beta[j,1]
sxy<-t(Yres)%*%X[,j]
ssx<-sum(X[,j]^2)
SS<-sqrt(n-1)*sxy/(sigma*ssx)
zeta<-get.zeta.ising(SS=SS, beta=beta, alpha=alpha, hyperparam=hyperparam, 
      structure=linearrelation, edgeind=edgeind, j=j)



