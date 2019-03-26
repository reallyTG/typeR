library(spBayesSurv)


### Name: survregbayes2
### Title: Bayesian Semiparametric Survival Models
### Aliases: survregbayes2 print.survregbayes2 plot.survregbayes2
###   summary.survregbayes2 print.summary.survregbayes2

### ** Examples

rm(list=ls())
library(coda)
library(survival)
library(spBayesSurv)

## True coeffs
betaT = c(1,1); 
## Baseline Survival
f0oft = function(t) 0.5*dlnorm(t, -1, 0.5)+0.5*dlnorm(t,1,0.5);
S0oft = function(t) (0.5*plnorm(t, -1, 0.5, lower.tail=FALSE)+
                       0.5*plnorm(t, 1, 0.5, lower.tail=FALSE));
## The Survival function:
Sioft = function(t,x,v=0)  exp( log(S0oft(t))*exp(sum(x*betaT)+v) ) ;
Fioft = function(t,x,v=0) 1-Sioft(t,x,v);
## The inverse for Fioft
Finv = function(u, x,v=0) uniroot(function (t) Fioft(t,x,v)-u, 
                                  lower=1e-100, upper=1e100,
                                  extendInt ="yes")$root

##-------------Generate data-------------------##
## generate x 
n = 100; 
x1 = rbinom(n, 1, 0.5); x2 = rnorm(n, 0, 1); X = cbind(x1, x2);
## generate survival times
u = runif(n);
tT = rep(0, n);
for (i in 1:n){
  tT[i] = Finv(u[i], X[i,]);
}

### ----------- partly interval-censored -------------###
t1=rep(NA, n);t2=rep(NA, n); delta=rep(NA, n); 
n1 = floor(0.5*n); ## right-censored part
n2 = n-n1; ## interval-censored part
# right-censored part
rcen = sample(1:n, n1);
t1_r=tT[rcen];t2_r=tT[rcen];
Centime = runif(n1, 2, 6);
delta_r = (tT[rcen]<=Centime) +0 ; length(which(delta_r==0))/n1;
t1_r[which(delta_r==0)] = Centime[which(delta_r==0)];
t2_r[which(delta_r==0)] = NA;
t1[rcen]=t1_r; t2[rcen]=t2_r; delta[rcen] = delta_r;
# interval-censored part
intcen = (1:n)[-rcen];
t1_int=rep(NA, n2);t2_int=rep(NA, n2); delta_int=rep(NA, n2);
npois = rpois(n2, 2)+1;
for(i in 1:n2){
  gaptime = cumsum(rexp(npois[i], 1)); 
  pp = Fioft(gaptime, X[intcen[i],]);
  ind = sum(u[intcen[i]]>pp); 
  if (ind==0){
    delta_int[i] = 2;
    t2_int[i] = gaptime[1];
  }else if (ind==npois[i]){
    delta_int[i] = 0;
    t1_int[i] = gaptime[ind];
  }else{
    delta_int[i] = 3;
    t1_int[i] = gaptime[ind];
    t2_int[i] = gaptime[ind+1];
  }
}
t1[intcen]=t1_int; t2[intcen]=t2_int; delta[intcen] = delta_int;
## make a data frame
d = data.frame(t1=t1, t2=t2, x1=x1, x2=x2, delta=delta, tT=tT);
table(d$delta)/n;

##-------------spBayesSurv-------------------##
fit0=survreg(formula = Surv(t1, t2, type="interval2")~x1+x2, 
             data=d, dist="loglogistic");
# MCMC parameters
nburn=500; nsave=500; nskip=0; niter = nburn+nsave
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=500);
prior = list(maxL=4, a0=1, b0=1);
ptm<-proc.time()
res = survregbayes2(formula = Surv(t1, t2, type="interval2")~x1+x2, data=d, 
                     survmodel="PH", prior=prior, mcmc=mcmc, 
                    dist="loglogistic", InitParamMCMC=FALSE);
## Note InitParamMCMC=FALSE is used only speeding,
## InitParamMCMC=TRUE is recommended in general. 
sfit=summary(res); sfit;
systime=proc.time()-ptm; 

### trace plots
par(mfrow = c(2,2));
traceplot(mcmc(res$beta[1,]), main="beta1");
traceplot(mcmc(res$beta[2,]), main="beta2");

####################################################################
## Get curves
####################################################################
par(mfrow = c(1,1));
wide=0.01;
tgrid = seq(0.001,4,wide);
ngrid = length(tgrid);
xnew = c(0,1)
xpred = cbind(c(0,0), xnew); 
nxpred = nrow(xpred);
estimates=plot(res, xpred, tgrid);
## plots
## survival function when x=(0,0)
i=2
par(cex=1.5,mar=c(4.1,4.1,1,1),cex.lab=1.4,cex.axis=1.1)
plot(tgrid, Sioft(tgrid, c(0,xnew[i])), "l", lwd=3, 
     xlim=c(0,3), xlab="time", ylab="survival");
polygon(x=c(rev(tgrid),tgrid),
        y=c(rev(estimates$Shatlow[,i]),estimates$Shatup[,i]),
        border=NA,col="lightgray");
lines(tgrid, Sioft(tgrid, c(0,xnew[i])), "l", lwd=3);
lines(tgrid, estimates$Shat[,i], lty=3, lwd=3, col=1);
## survival function when x=(0,0)
i=1
par(cex=1.5,mar=c(4.1,4.1,1,1),cex.lab=1.4,cex.axis=1.1)
lines(tgrid, Sioft(tgrid, c(0,xnew[i])), "l", lwd=3, 
     xlim=c(0,3), xlab="time", ylab="survival");
polygon(x=c(rev(tgrid),tgrid),
        y=c(rev(estimates$Shatlow[,i]),estimates$Shatup[,i]),
        border=NA,col="lightgray");
lines(tgrid, Sioft(tgrid, c(0,xnew[i])), "l", lwd=3);
lines(tgrid, estimates$Shat[,i], lty=3, lwd=3, col=1);



