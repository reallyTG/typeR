library(BSPADATA)


### Name: hetero_general
### Title: Bayesian fitting of Spatial General Model with heteroscedastic
###   normal error term.
### Aliases: hetero_general
### Keywords: Bayesian Metropolis Hastings Spatial Econometric Models
###   Heteroscedastic Error Term Heteroscedastic General Model

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
W1=COL.nb
matstand=nb2mat(W1)
A=diag(n)-0.70*matstand
B=diag(n)-0.20*matstand
miu=solve(A)%*%(-35+0.35*x1-1.7*x2)
Sigma2=t(solve(A)%*%solve(B))%*%Sigma%*%solve(A)%*%solve(B)
y=rmvnorm(1,miu,Sigma2)
y_1=t(y)
y=y_1
data(oldcol)
W1=COL.nb
hetero_general(y,X,Z,W1=W1,nsim=500,burn=25,step=5,b_pri=rep(0,3),B_pri=diag(rep(1000,3)),
g_pri=rep(0,3),G_pri=diag(rep(1000,3)),
beta_0=rep(0,3),gammas_0=c(10,0,0),rho_0=0.5,lambda_0=0.5,
kernel="normal",plot="FALSE",mateq="TRUE")



