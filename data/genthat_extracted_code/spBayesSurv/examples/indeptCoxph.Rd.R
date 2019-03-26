library(spBayesSurv)


### Name: indeptCoxph
### Title: Bayesian Proportional Hazards Model
### Aliases: indeptCoxph print.indeptCoxph summary.indeptCoxph
###   print.summary.indeptCoxph
### Keywords: Cox PH Bayesian

### ** Examples

###############################################################
# A simulated data: Cox PH
###############################################################
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
## True parameters 
betaT = c(1,1); 
n=100; 
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

## generate x 
x1 = rbinom(n, 1, 0.5); x2 = rnorm(n, 0, 1); X = cbind(x1, x2);
## generate survival times
u = runif(n);
tT = rep(0, n);
for (i in 1:n){
  tT[i] = Finv(u[i], X[i,]);
}

### ----------- right-censored -------------###
t_obs=tT 
Centime = runif(n, 2, 6);
delta = (tT<=Centime) +0 ; 
length(which(delta==0))/n; # censoring rate
rcen = which(delta==0);
t_obs[rcen] = Centime[rcen]; ## observed time 
## make a data frame
d = data.frame(tobs=t_obs, x1=x1, x2=x2, delta=delta, tT=tT); 
table(d$delta)/n;

###############################################################
# Independent Cox PH
###############################################################
# MCMC parameters
nburn=500; nsave=300; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(M=10, r0=1);
# Fit the Cox PH model
res1 = indeptCoxph(formula = Surv(tobs, delta)~x1+x2, data=d, 
                   prior=prior, mcmc=mcmc);
sfit1=summary(res1); sfit1;
## traceplot
par(mfrow = c(2,2))
traceplot(mcmc(res1$beta[1,]), main="beta1")
traceplot(mcmc(res1$beta[2,]), main="beta2")
traceplot(mcmc(res1$h.scaled[2,]), main="h")
traceplot(mcmc(res1$h.scaled[3,]), main="h")

############################################
## Curves
############################################
par(mfrow = c(1,1))
tgrid = seq(1e-10,4,0.1);
xpred = data.frame(x1=c(0,0), x2=c(0,1)); 
plot(res1, xnewdata=xpred, tgrid=tgrid);



