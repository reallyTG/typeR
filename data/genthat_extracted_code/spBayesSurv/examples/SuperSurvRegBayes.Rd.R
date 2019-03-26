library(spBayesSurv)


### Name: SuperSurvRegBayes
### Title: Bayesian Semiparametric Super Survival Model
### Aliases: SuperSurvRegBayes print.SuperSurvRegBayes
###   summary.SuperSurvRegBayes print.summary.SuperSurvRegBayes

### ** Examples

#################################################################
# A simulated data based on PH_PO_AFT super model
#################################################################
rm(list=ls())
library(coda)
library(survival)
library(spBayesSurv)

## True coeffs
betaT_h = c(1, 1);
betaT_o = c(0, 0);
betaT_q = c(1, 1);
## Baseline Survival
f0oft = function(t) 0.5*dlnorm(t, -1, 0.5)+0.5*dlnorm(t,1,0.5);
S0oft = function(t) {
  0.5*plnorm(t, -1, 0.5, lower.tail=FALSE)+
    0.5*plnorm(t, 1, 0.5, lower.tail=FALSE)
}
h0oft = function(t) f0oft(t)/S0oft(t);
## The Survival function:
Sioft = function(t,x){
  xibeta_h = sum(x*betaT_h);
  xibeta_o = sum(x*betaT_o);
  xibeta_q = sum(x*betaT_q);
  (1+exp(xibeta_o-xibeta_h+xibeta_q)*
     (1/S0oft(exp(xibeta_q)*t)-1))^(-exp(xibeta_h-xibeta_q));
}
Fioft = function(t,x) 1-Sioft(t,x);
## The inverse for Fioft
Finv = function(u, x) uniroot(function (t) Fioft(t,x)-u, lower=1e-100, 
                              upper=1e100, extendInt ="yes", tol=1e-6)$root
### true plots
tt=seq(1e-10, 4, 0.02);
xpred1 = c(0,0);
xpred2 = c(0,1);
plot(tt, Sioft(tt, xpred1), "l", ylim=c(0,1));
lines(tt, Sioft(tt, xpred2), "l");

##-------------Generate data-------------------##
## generate x 
n = 80; 
x1 = rbinom(n, 1, 0.5); x2 = rnorm(n, 0, 1); X = cbind(x1, x2);
## generate survival times
u = runif(n);
tT = rep(0, n);
for (i in 1:n){
  tT[i] = Finv(u[i], X[i,]);
}

### ----------- right censored -------------###
t1=tT;t2=tT;
Centime = runif(n, 2, 6);
delta = (tT<=Centime) +0 ; length(which(delta==0))/n;
rcen = which(delta==0);
t1[rcen] = Centime[rcen];
t2[rcen] = NA;
## make a data frame
d = data.frame(t1=t1, t2=t2, x1=x1, x2=x2, delta=delta, tT=tT); table(d$delta)/n;

##-------------Fit the model-------------------##
# MCMC parameters
nburn=200; nsave=500; nskip=0; niter = nburn+nsave
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(maxL=15, a0=1, b0=1, M=10, q=.9);
ptm<-proc.time()
res1 = SuperSurvRegBayes(formula = Surv(t1, t2, type="interval2")~x1+x2, data=d, 
                          prior=prior, mcmc=mcmc, dist="lognormal");
sfit=summary(res1); sfit;
systime1=proc.time()-ptm; systime1;
par(mfrow = c(3,2))
traceplot(mcmc(res1$beta_h[1,]), main="beta_h for x1");
traceplot(mcmc(res1$beta_h[2,]), main="beta_h for x2");
traceplot(mcmc(res1$beta_o[1,]), main="beta_o for x1");
traceplot(mcmc(res1$beta_o[2,]), main="beta_o for x2");
traceplot(mcmc(res1$beta_q[1,]), main="beta_q for x1");
traceplot(mcmc(res1$beta_q[2,]), main="beta_q for x2");

####################################################################
## Get curves
####################################################################
par(mfrow = c(1,1))
tgrid = seq(1e-10,4,0.2);
xpred = data.frame(x1=c(0,0), x2=c(0,1)); 
plot(res1, xnewdata=xpred, tgrid=tgrid);



