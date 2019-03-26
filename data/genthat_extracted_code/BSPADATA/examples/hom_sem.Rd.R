library(BSPADATA)


### Name: hom_sem
### Title: Bayesian fitting of Spatial Error Model (SEM) with homoscedastic
###   normal error term.
### Aliases: hom_sem
### Keywords: Bayesian Metropolis Hastings Spatial Econometric Models SEM
###   Model

### ** Examples

library(spdep)
library(mvtnorm)
library(pscl)
n=49
x0=rep(1,n)
x1=runif(n,0,400)
x2=runif(n,10,23)
X=cbind(x0,x1,x2)
sigma2=rep(45,n)
Sigma=diag(sigma2)
data(oldcol)
W=COL.nb
matstand=nb2mat(W)
A=diag(n)-0.85*matstand
miu=(18+0.026*x1-0.4*x2)
Sigma2=t(solve(A))%*%Sigma%*%solve(A)
y=rmvnorm(1,miu,Sigma2)
y_1=t(y)
y=y_1
hom_sem(y,X,W=COL.nb,nsim=500,burn=25,step=5,b_pri=rep(0,3),B_pri=diag(rep(1000,3)),
r_pri=0.01,lambda_pri=0.01,beta_0=rep(0,3),
sigma2_0=90,lambda_0=0.5,kernel="normal",plot=FALSE)



