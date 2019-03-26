library(spBayesSurv)


### Name: spCopulaCoxph
### Title: Marginal Bayesian Proportional Hazards Model via Spatial Copula
### Aliases: spCopulaCoxph print.spCopulaCoxph summary.spCopulaCoxph
###   print.summary.spCopulaCoxph
### Keywords: Spatial copula Cox PH Bayesian

### ** Examples

###############################################################
# A simulated data: spatial Copula Cox PH
###############################################################
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
## True parameters 
betaT = c(1,1); 
theta1 = 0.98; theta2 = 0.1;
n=50; npred=3; ntot = n+npred;
## Baseline Survival
f0oft = function(t) 0.5*dlnorm(t, -1, 0.5)+0.5*dlnorm(t,1,0.5);
S0oft = function(t) (0.5*plnorm(t, -1, 0.5, lower.tail=FALSE)+
                       0.5*plnorm(t, 1, 0.5, lower.tail=FALSE))
## The Survival function:
Sioft = function(t,x)  exp( log(S0oft(t))*exp(sum(x*betaT)) ) ;
fioft = function(t,x) exp(sum(x*betaT))*f0oft(t)/S0oft(t)*Sioft(t,x);
Fioft = function(t,x) 1-Sioft(t,x);
## The inverse for Fioft
Finv = function(u, x) uniroot(function (t) Fioft(t,x)-u, lower=1e-100, 
                              upper=1e100, extendInt ="yes", tol=1e-6)$root

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
x1 = rbinom(ntot, 1, 0.5); x2 = rnorm(ntot, 0, 1); X = cbind(x1, x2);
## generate transformed log of survival times
z = MASS::mvrnorm(1, rep(0, ntot), corT);
## generate survival times
u = pnorm(z);
tT = rep(0, ntot);
for (i in 1:ntot){
  tT[i] = Finv(u[i], X[i,]);
}

### ----------- right-censored -------------###
t_obs=tT 
Centime = runif(ntot, 2, 6);
delta = (tT<=Centime) +0 ; 
length(which(delta==0))/ntot; # censoring rate
rcen = which(delta==0);
t_obs[rcen] = Centime[rcen]; ## observed time 
## make a data frame
dtot = data.frame(tobs=t_obs, x1=x1, x2=x2, delta=delta, tT=tT,
                  s1=s1, s2=s2); 
## Hold out npred for prediction purpose
predindex = sample(1:ntot, npred);
dpred = dtot[predindex,];
d = dtot[-predindex,];
# Prediction settings 
prediction = list(xpred=cbind(dpred$x1, dpred$x2), 
                  spred=cbind(dpred$s1, dpred$s2));

###############################################################
# Independent Cox PH
###############################################################
# MCMC parameters
nburn=500; nsave=500; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(M=10, r0=1, nknots=10, nblock=n);
# here nknots=10<n, so FSA will be used with nblock=n.
# As nknots is getting larger, the FSA is more accurate but slower
# As nblock is getting smaller, the FSA is more accurate but slower. 
# In most applications, setting nblock=n works fine, which is the
# setting by not specifying nblock. 
# If nknots is not specified or nknots=n, the exact covariance is used. 
# Fit the Cox PH model
res1 = spCopulaCoxph(formula = Surv(tobs, delta)~x1+x2, data=d, 
                     prior=prior, mcmc=mcmc, prediction=prediction,
                     Coordinates=cbind(d$s1,d$s2), Knots=NULL);
# here if prediction=NULL, prediction$xpred will be set as the design matrix
# in formula, and prediction$spred will be set as the Coordinates argument. 
# Knots=NULL is the defualt setting, for which the knots will be generated 
# using fields::cover.design() with number of knots equal to prior$nknots. 
sfit1=summary(res1); sfit1;
## MSPE
mean((dpred$tT-apply(res1$Tpred, 1, median))^2); 

## traceplot
par(mfrow = c(2,2))
traceplot(mcmc(res1$beta[1,]), main="beta1")
traceplot(mcmc(res1$beta[2,]), main="beta2")
traceplot(mcmc(res1$theta[1,]), main="sill")
traceplot(mcmc(res1$theta[2,]), main="range")

############################################
## Curves
############################################
par(mfrow = c(1,1))
tgrid = seq(1e-10,4,0.1);
xpred = data.frame(x1=c(0,0), x2=c(0,1)); 
plot(res1, xnewdata=xpred, tgrid=tgrid);



