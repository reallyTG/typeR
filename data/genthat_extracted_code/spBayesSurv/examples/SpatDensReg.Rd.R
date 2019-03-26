library(spBayesSurv)


### Name: SpatDensReg
### Title: Bayesian Nonparametric Spatially Smoothed Density Estimation
### Aliases: SpatDensReg BF.SpatDensReg print.SpatDensReg
###   summary.SpatDensReg print.summary.SpatDensReg

### ** Examples

## Simulated data
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)

## True conditional density
fiofy_x = function(y, x){
  0.5*dnorm(y, -x, 1)+0.5*dnorm(y, x, 1);
}

## Generate data
n = 200;
x = runif(n, 0, 3)
y = rep(0, n);
uu = runif(n);
for(i in 1:n){
  if(uu[i]<0.5){
    y[i] = rnorm(1, -x[i], 1);
  }else{
    y[i] = rnorm(1, x[i], 1);
  }
}

## right censored 
y1=y;y2=y;
Centime = runif(n, 2, 4); 
delta = (y<=Centime) +0 ; 
length(which(delta==0))/n; ## censoring rate
rcen = which(delta==0);
y1[rcen] = Centime[rcen];
y2[rcen] = NA;
## make a data frame
## Method 1: in the interval-censoring notation: 
## y1 is the left endpoint and y2 is the right endpoint.
## This way we could use Surv(y1, y2, type="interval2")
## Method 2: Because we have right-censored data, 
## we could use y1 as the observed survival times and delta as the indicator. 
## This way we could use Surv(y1, delta). This is the same as above. 
d = data.frame(y1=y1, y2=y2, x=x, delta=delta); 

##-------------fit the model-------------------##
# MCMC parameters
nburn=50; nsave=50; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=50);
prior = list(maxL=4, phiq0=0);
# Note please set 0<phiq0<1 for a valid Bayes factor of testing 
# spatial model vs. exchangeable model.
# If the Bayes factor is not needed, setting phiq0=0 will speed up 
# the computing time about seven times. 
state = list(alpha=1);
ptm<-proc.time()
res1 = SpatDensReg(formula = Surv(y1, delta)~x, data=d, 
                   prior=prior, state=state, mcmc=mcmc, permutation = TRUE, 
                   fix.theta=FALSE);
## Or equivalently formula = Surv(y1, y2, type="interval2") can also be used.
sfit=summary(res1); sfit
systime1=proc.time()-ptm; systime1;
traceplot(mcmc(res1$theta[1,]))
traceplot(mcmc(res1$theta[2,]))
traceplot(mcmc(res1$alpha))
traceplot(mcmc(res1$phi))

## plots
ygrid = seq(-6, 6,length.out=100);
xpred = data.frame(x=c(0,1,2,3)); 
plot(res1, xnewdata=xpred, ygrid=ygrid);



