library(spBayesSurv)


### Name: spCopulaDDP
### Title: Marginal Bayesian Nonparametric Survival Model via Spatial
###   Copula
### Aliases: spCopulaDDP
### Keywords: Spatial copula Bayesian nonparametric

### ** Examples

###############################################################
# A simulated data: mixture of two normals with spatial dependence
###############################################################
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
## True parameters 
betaT = cbind(c(3.5, 0.5), c(2.5, -1)); 
wT = c(0.4, 0.6); 
sig2T = c(1^2, 0.5^2);
theta1 = 0.98; theta2 = 0.1;
n=30; npred=3; ntot = n+npred;
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

## generate coordinates: 
## npred is the # of locations for prediction
ldist = 100; wdist = 40;
s1 = runif(ntot, 0, wdist); s2 = runif(ntot, 0, ldist);
s = cbind(s1,s2); #plot(s[,1], s[,2]);
## Covariance matrix
corT = matrix(1, ntot, ntot);
for (i in 1:(ntot-1)){
  for (j in (i+1):ntot){
    dij = sqrt(sum( (s[i,]-s[j,])^2 ));
    corT[i,j] = theta1*exp(-theta2*dij);
    corT[j,i] = theta1*exp(-theta2*dij);
  }
}

## generate x 
x1 = runif(ntot,-1.5,1.5); X = cbind(x1);
## generate transformed log of survival times
z = MASS::mvrnorm(1, rep(0, ntot), corT);
## generate survival times
u = pnorm(z);
tT = rep(0, ntot);
for (i in 1:ntot){
  tT[i] = exp(Finv(u[i], X[i,]));
}

### ----------- right-censored -------------###
t_obs=tT 
Centime = runif(ntot, 200, 500);
delta = (tT<=Centime) +0 ; 
length(which(delta==0))/ntot; # censoring rate
rcen = which(delta==0);
t_obs[rcen] = Centime[rcen]; ## observed time 
## make a data frame
dtot = data.frame(tobs=t_obs, x1=x1, delta=delta, tT=tT,
                  s1=s1, s2=s2); 
## Hold out npred for prediction purpose
predindex = sample(1:ntot, npred);
dpred = dtot[predindex,];
d = dtot[-predindex,];
# Prediction settings 
prediction = list(xpred=cbind(dpred$x1), 
                  spred=cbind(dpred$s1, dpred$s2));

###############################################################
# Independent DDP: Bayesian Nonparametric Survival Model
###############################################################
# MCMC parameters
nburn=100; nsave=100; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(N=10, a0=2, b0=2, nknots=n, nblock=round(n/2));
# here nknots=n, so FSA is not used.
# If nknots<n, FSA will be used with nblock=round(n/2).
# As nknots is getting larger, the FSA is more accurate but slower
# As nblock is getting smaller, the FSA is more accurate but slower. 
# In most applications, setting nblock=n works fine, which is the
# setting by not specifying nblock. 
# If nknots is not specified or nknots=n, the exact covariance is used. 
# Fit the Cox PH model
res1 = spCopulaDDP(formula = Surv(tobs, delta)~x1, data=d, 
                     prior=prior, mcmc=mcmc, prediction=prediction,
                     Coordinates=cbind(d$s1,d$s2), Knots=NULL);
# here if prediction=NULL, prediction$xpred will be set as the design matrix
# in formula, and prediction$spred will be set as the Coordinates argument. 
# Knots=NULL is the defualt setting, for which the knots will be generated 
# using fields::cover.design() with number of knots equal to prior$nknots. 
## LPML
LPML = sum(log(res1$cpo)); LPML;
## Number of non-negligible components
quantile(colSums(res1$w>0.05))
## MSPE
mean((log(dpred$tT)-apply(log(res1$Tpred), 1, median))^2); 

## traceplot
par(mfrow = c(1,2))
traceplot(mcmc(res1$theta[1,]), main="sill")
traceplot(mcmc(res1$theta[2,]), main="range")

############################################
## Curves
############################################
ygrid = seq(0,6.0,length=100); tgrid = exp(ygrid);
ngrid = length(tgrid);
xpred = data.frame(x1=c(-1, 1)); 
plot(res1, xnewdata=xpred, tgrid=tgrid);



