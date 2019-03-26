library(spBayesSurv)


### Name: anovaDDP
### Title: Bayesian Nonparametric Survival Model
### Aliases: anovaDDP
### Keywords: ANOVA DDP Bayesian nonparametric

### ** Examples

###############################################################
# A simulated data: mixture of two normals
###############################################################
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
## True parameters 
betaT = cbind(c(3.5, 0.5), c(2.5, -1)); 
wT = c(0.4, 0.6); 
sig2T = c(1^2, 0.5^2);
n=100; 
## The Survival function for log survival times:
fiofy = function(y, xi, w=wT){
  nw = length(w);
  ny = length(y);
  res = matrix(0, ny, nw);
  Xi = c(1,xi);
  for (k in 1:nw){
    res[,k] = w[k]*dnorm(y, sum(Xi*betaT[,k]), sqrt(sig2T[k]) )
  }
  apply(res, 1, sum)
}
fioft = function(t, xi, w=wT) fiofy(log(t), xi, w)/t;
Fiofy = function(y, xi, w=wT){
  nw = length(w);
  ny = length(y);
  res = matrix(0, ny, nw);
  Xi = c(1,xi);
  for (k in 1:nw){
    res[,k] = w[k]*pnorm(y, sum(Xi*betaT[,k]), sqrt(sig2T[k]) )
  }
  apply(res, 1, sum)
}
Fioft = function(t, xi, w=wT) Fiofy(log(t), xi, w);
## The inverse for Fioft
Finv = function(u, x) uniroot(function (y) Fiofy(y,x)-u, lower=-250, 
                              upper=250, extendInt ="yes", tol=1e-6)$root

## generate x 
x1 = runif(n,-1.5,1.5); X = cbind(x1);
## generate survival times
u = runif(n);
tT = rep(0, n);
for (i in 1:n){
  tT[i] = exp(Finv(u[i], X[i,]));
}

### ----------- right-censored -------------###
t_obs=tT 
Centime = runif(n, 20, 200);
delta = (tT<=Centime) +0 ; 
length(which(delta==0))/n; # censoring rate
rcen = which(delta==0);
t_obs[rcen] = Centime[rcen]; ## observed time 
## make a data frame
d = data.frame(tobs=t_obs, x1=x1, delta=delta, tT=tT); 
table(d$delta)/n;

###############################################################
# Independent DDP: Bayesian Nonparametric Survival Model
###############################################################
# MCMC parameters
nburn=500; nsave=500; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(N=10, a0=2, b0=2);
# Fit the Cox PH model
res1 = anovaDDP(formula = Surv(tobs, delta)~x1, data=d, 
                prior=prior, mcmc=mcmc);
## LPML
LPML = sum(log(res1$cpo)); LPML;
## Number of non-negligible components
quantile(colSums(res1$w>0.05))

############################################
## Curves
############################################
ygrid = seq(0,6.0,length=100); tgrid = exp(ygrid);
xpred = data.frame(x1=c(-1, 1))
plot(res1, xnewdata=xpred, tgrid=tgrid);




