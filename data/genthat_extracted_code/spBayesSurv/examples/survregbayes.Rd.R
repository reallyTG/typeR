library(spBayesSurv)


### Name: survregbayes
### Title: Bayesian Semiparametric Survival Models
### Aliases: survregbayes print.survregbayes summary.survregbayes
###   print.summary.survregbayes

### ** Examples

rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
library(MASS)
library(fields)

## True coeffs
betaT = c(1,1); 
## Baseline Survival
f0oft = function(t) 0.5*dlnorm(t, -1, 0.5)+0.5*dlnorm(t,1,0.5);
S0oft = function(t) (0.5*plnorm(t, -1, 0.5, lower.tail=FALSE)+
                       0.5*plnorm(t, 1, 0.5, lower.tail=FALSE))
## The Survival function:
Sioft = function(t,x,v=0)  exp( log(S0oft(t))*exp(sum(x*betaT)+v) ) ;
Fioft = function(t,x,v=0) 1-Sioft(t,x,v);
## The inverse for Fioft
Finv = function(u, x,v=0) uniroot(function (t) Fioft(t,x,v)-u, lower=1e-100, 
                                  upper=1e100, extendInt ="yes", tol=1e-6)$root
## correlation function
rho_Exp = function(dis, phi) exp(-(dis*phi));

###############################################################################
########################### Start to simulation ###############################
###############################################################################
phiT=1; sill=0.9999; ## phiT is the range parameter phi. 
tau2T = 1; ## true frailty variance; 
m = 50; mi=2
id=rep(1:m, each=mi)
mseq = rep(mi, m);
n = sum(mseq);
s1 = runif(m, 0, 10); s2 = runif(m, 0, 10);
locs = cbind(s1, s2); 
ss = cbind(rep(locs[,1],each=mi), rep(locs[,2],each=mi)); ### the locations. 
Dmm = .Call("DistMat", t(locs), t(locs), PACKAGE = "spBayesSurv");
Rmm = sill*rho_Exp(Dmm, phiT)+diag(1-sill, m, m);
v = mvrnorm(1, mu=rep(0,m), Sigma=tau2T*Rmm); 
vn = rep(v, each=mi)
## generate x 
x1 = rbinom(n, 1, 0.5); x2 = rnorm(n, 0, 1); X = cbind(x1, x2);
## generate survival times
u = runif(n);
tT = rep(0, n);
for (i in 1:n){
  tT[i] = Finv(u[i], X[i,], vn[i]);
}

### ----------- right censored -------------###
t1=tT;t2=tT;
## right censored
Centime = runif(n, 2,6);
delta = (tT<=Centime) +0 ; length(which(delta==0))/n;
rcen = which(delta==0);
t1[rcen] = Centime[rcen];
t2[rcen] = NA;
## make a data frame
## Method 1: in the interval-censoring notation: 
## t1 is the left endpoint and t2 is the right endpoint.
## This way we could use Surv(t1, t2, type="interval2")
## Method 2: Because we have right-censored data, 
## we could use t1 as the observed survival times and delta as the indicator. 
## This way we could use Surv(t1, delta). This is the same as above. 
## (s1, s2) are the locations. 
d = data.frame(t1=t1, t2=t2, x1=x1, x2=x2, delta=delta, 
               s1=ss[,1], s2=ss[,2], id=id); 
table(d$delta)/n;

##-------------spBayesSurv-------------------##
# MCMC parameters
nburn=200; nsave=200; nskip=0;
# Note larger nburn, nsave and nskip should be used in practice.
mcmc=list(nburn=nburn, nsave=nsave, nskip=nskip, ndisplay=1000);
prior = list(maxL=15, a0=1, b0=1, nknots=m, nblock=m, nu=1);
# here if nknots<m, FSA will be used with nblock=m.
cor.dist = function(x1, x2) rdist(x1,x2)
ptm<-proc.time()
res1 = survregbayes(formula = Surv(t1, delta)~x1+x2+
                       frailtyprior("grf", id), data=d, InitParamMCMC=FALSE,
                     survmodel="PH", prior=prior, mcmc=mcmc, DIST=cor.dist,
                     dist="loglogistic", Coordinates = locs);
## Or equivalently formula = Surv(t1, t2, type="interval2") can also be used.
## Note InitParamMCMC=FALSE is used for speeding,
## InitParamMCMC=TRUE is recommended in general. 
sfit=summary(res1); sfit
systime1=proc.time()-ptm; systime1;

############################################
## Results
############################################
## acceptance rate of frailties
res1$ratev[1]
## traceplots;
par(mfrow=c(2,3));
traceplot(mcmc(res1$beta[1,]), main="beta1");
traceplot(mcmc(res1$beta[2,]), main="beta2");
traceplot(mcmc(res1$v[1,]), main="frailty");
traceplot(mcmc(res1$v[2,]), main="frailty");
traceplot(mcmc(res1$v[3,]), main="frailty");
#traceplot(mcmc(res1$v[4,]), main="frailty");
traceplot(mcmc(res1$phi), main="phi");

############################################
## Curves
############################################
par(mfrow=c(1,1));
wide=0.2;
tgrid = seq(1e-10,4,wide);
ngrid = length(tgrid);
p = length(betaT); # number of covariates
newdata = data.frame(x1=c(0,0), x2=c(0,1))
plot(res1, xnewdata=newdata, tgrid=tgrid, PLOT=TRUE);

## Cox-Snell plot
set.seed(1)
cox.snell.survregbayes(res1, ncurves=2, PLOT=TRUE);



