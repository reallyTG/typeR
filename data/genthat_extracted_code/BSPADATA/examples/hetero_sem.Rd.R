library(BSPADATA)


### Name: hetero_sem
### Title: Bayesian fitting of Spatial Error Model (SEM) model with
###   heteroscedastic normal error term.
### Aliases: hetero_sem
### Keywords: Bayesian Metropolis Hastings Spatial Econometric Models
###   Heteroscedastic Error Term Heteroscedastic SEM Model

### ** Examples

library(spdep)
library(mvtnorm)
library(pscl)
n=49
x0=rep(1,n)
x1=runif(n,0,400)
x2=runif(n,10,23)
x3=runif(n,0,10)
X=cbind(x0,x1,x2)
Z=cbind(x0,x1,x3)
gammas=c(-8,0.026,-0.4)
Sigma=diag(c(exp(Z%*%gammas)))
data(oldcol)
W=COL.nb
matstand=nb2mat(W)
A=diag(n)-0.75*matstand
miu=-35+0.35*x1-1.7*x2
Sigma2=t(solve(A))%*%Sigma%*%solve(A)
y=rmvnorm(1,miu,Sigma2)
y_1=t(y)
y=y_1
data(oldcol)
W=COL.nb
hetero_sem(y,X,Z,W,nsim=500,burn=25,step=5,b_pri=rep(0,3),B_pri=diag(rep(1000,3)),g_pri=rep(0,3),
G_pri=diag(rep(1000,3)),
beta_0=rep(0,3),gammas_0=c(10,0,0),lambda_0=0.5,kernel="normal",plot="FALSE")



