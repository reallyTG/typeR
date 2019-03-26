library(spBayesSurv)


### Name: frailtyGAFT
### Title: Generalized Accelerated Failure Time Frailty Model
### Aliases: frailtyGAFT print.frailtyGAFT summary.frailtyGAFT
###   print.summary.frailtyGAFT

### ** Examples

###############################################################
# A simulated data: GAFT spatial frailty model
###############################################################
rm(list=ls())
library(survival)
library(spBayesSurv)
library(coda)
library(MASS)

## True densities
set.seed(1)
Finvsingle = function(u, F) {
  res = uniroot(function (x) F(x)-u, lower=-1000, upper=1000, 
                tol=.Machine$double.eps^0.5);
  res$root
}
Finv = function(u, F) {sapply(u, Finvsingle, F)};
f0 = function(x) dnorm(x, 0, 0.8);
F0 = function(x) pnorm(x, 0, 0.8);
shift=1
f1 = function(x) 0.5*dnorm(x, -shift, 0.5) + 0.5*dnorm(x, shift, 0.5)
F1 = function(x) 0.5*pnorm(x, -shift, 0.5) + 0.5*pnorm(x, shift, 0.5);
ff = function(x, xtf=0) {
  if(xtf==0) {res=f0(x)} else res=f1(x)
  res
}
FF = function(x, xtf=0){
  if(xtf==0) {res=F0(x)} else res=F1(x)
  res
}

# Simulation settings;
betaT = c(-1, 1, -0.5);
tau2T = 0.1;
m = 50; # blocks
mi = 2;
mis = rep(mi, m);
id = rep(1:m,mis);
n = length(id); # Total number of subjects
# Generate symmetric adjaceny matrix, W 
wi = rep(0, m)
while(any(wi==0)){
  W = matrix(0,m,m)
  W[upper.tri(W,diag=FALSE)]<-rbinom(m*(m-1)/2,1,.1)
  W = W+t(W) 
  wi = apply(W,1,sum)  # No. neighbors
}
# Spatial effects, v
Wstar = matrix(0, m-1, m-1);
Dstar = diag(wi[-m]);
for(i in 1:(m-1)){
  for(j in 1:(m-1)){
    Wstar[i,j] = W[j,i]-W[j,m]-W[m,i]-wi[m]
  }
}
Qstar = Dstar-Wstar;
covT = tau2T*solve(Qstar);
v0 = mvrnorm(1, mu=rep(0,m-1), Sigma=covT);
v = c(v0,-sum(v0));
vn = rep(v, mis);

# responses
x1 = rnorm(n, 0, 1);
x2 = rbinom(n, 1, 0.5);
xtf = x2; ptf = 2;
X = cbind(1,x1,x2); pce = ncol(X);
u = runif(n, 0, 1)
y = rep(0, n);
for(i in 1:n) {
  if(x2[i]==1) {
    y[i] = sum(betaT*X[i,]) + vn[i] + Finv(u[i], F1)
  }else{
    y[i] = sum(betaT*X[i,]) + vn[i] + Finv(u[i], F0)
  } 
}

# generate responses
Cen = runif(n, 0.5, 1)
delta = (exp(y)<=Cen)+0;
sum(delta)/n
tTrue = exp(y);
tobs = cbind(tTrue, tTrue);
tobs[which(delta==0),] = cbind(Cen[which(delta==0)], NA);
dtotal = data.frame(tleft=tobs[,1], tright=tobs[,2], x1=x1, 
                    x2=x2, xtf=x2, ID=id, tTrue=tTrue, censor=delta);
## sort the data by ID
d = dtotal[order(dtotal$ID),];

# Prior information and MCMC
fit0 <- survival::survreg(Surv(tleft, censor)~x1+x2, dist="lognormal", data=d);
prior = list(maxL = 4, a0 = 5, b0 = 1);
mcmc=list(nburn=200, nsave=200, nskip=0, ndisplay=100)
# Note larger nburn, nsave and nskip should be used in practice.

# Fit the model
ptm<-proc.time()
res = frailtyGAFT(Surv(tleft, tright, type="interval2")~x1+x2+baseline(x1, x2)+
                    frailtyprior(prior="car", ID),  data=d, mcmc=mcmc, prior=prior, 
                  Proximity=W);
summary(res);
systime1=proc.time()-ptm; systime1;

### trace plots
par(mfrow = c(3,1))
traceplot(mcmc(res$beta[1,]), main="beta1");
traceplot(mcmc(res$beta[2,]), main="beta2");
traceplot(mcmc(res$beta[3,]), main="beta3");

####################################################################
## Get curves
####################################################################
par(mfrow = c(1,1))
xpred = data.frame(x1=c(1,1.5), x2=c(0,1))
xtfpred = xpred;
plot(res, xnewdata=xpred, xtfnewdata=xtfpred, CI=0.9);



