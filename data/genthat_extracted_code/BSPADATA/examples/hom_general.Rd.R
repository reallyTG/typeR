library(BSPADATA)


### Name: hom_general
### Title: Bayesian fitting of Spatial General Model with homoscedastic
###   normal error term.
### Aliases: hom_general
### Keywords: Bayesian Metropolis Hastings Spatial Econometric Models
###   General Model

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
W1=COL.nb
matstand=nb2mat(W1)
A=diag(n)-0.75*matstand
B=diag(n)-0.20*matstand
miu=solve(A)%*%(18+0.026*x1-0.4*x2)
Sigma2=t(solve(A)%*%solve(B))%*%Sigma%*%solve(A)%*%solve(B)
y=rmvnorm(1,miu,Sigma2)
y_1=t(y)
y=y_1
data(oldcol)
hom_general(y,X,W1=COL.nb,nsim=500,burn=25,step=5,b_pri=rep(0,3),B_pri=diag(rep(1000,3)),
r_pri=0.01,lambda_pri=0.01,beta_0=rep(0,3),
sigma2_0=90,rho_0=0.5,lambda_0=0.5,kernel="normal",
plot=FALSE,mateq=TRUE)




