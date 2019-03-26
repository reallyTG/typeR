library(BSPADATA)


### Name: hom_sar
### Title: Bayesian fitting of Spatial AutoRegressive (SAR) model with
###   homoscedastic normal error term.
### Aliases: hom_sar
### Keywords: Bayesian Metropolis Hastings Spatial Econometric Models SAR
###   Model

### ** Examples

library(spdep)
library(mvtnorm)
library(pscl)
data(oldcol)
n=49
x0=rep(1,n)
x1=runif(n,0,400)
x2=runif(n,10,23)
X=cbind(x0,x1,x2)
sigma2=rep(45,n)
Sigma=diag(sigma2)
W=COL.nb
matstand=nb2mat(W)
A=diag(n)-0.90*matstand
miu=solve(A)%*%(18+0.478*x1-1.3*x2)
Sigma2=t(solve(A))%*%Sigma%*%solve(A)
y=rmvnorm(1,miu,Sigma2)
y_1=t(y)
y=y_1
hom_sar(y,X,W=COL.nb,nsim=500,burn=25,step=5,b_pri=rep(0,3),B_pri=diag(rep(1000,3)),r_pri=0.01,
lambda_pri=0.01,beta_0=rep(0,3),
sigma2_0=90,rho_0=0.5,kernel="uniform")

  


