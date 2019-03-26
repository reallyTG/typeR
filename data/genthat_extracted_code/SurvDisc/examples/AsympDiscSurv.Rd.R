library(SurvDisc)


### Name: AsympDiscSurv
### Title: Asymptotic Estimate of Mean and Variance of Log-hazard Ratio for
###   Discrete Time Survival
### Aliases: AsympDiscSurv

### ** Examples

set.seed(1234)
nsim=1
n=250
k=50
trt=c(rep(0,n),rep(1,n))
betaef=rep(0,nsim)
varef=betaef
betapg=betaef
varpg=betaef
m1=3.05
for (i in 1:nsim){
  x=rexp(2*n,1)
  x[(n+1):(2*n)]=x[(n+1):(2*n)]/2
  x=ceiling(x*(k-1)/m1)
  x=pmin(x,k)
  cens=rbinom(2*n,1,0.9)
  pg1=PrenticeGloeckler.test(x,cens,trt,k)
  betapg[i]=pg1$coefficient
  varpg[i]=(pg1$coefficient/pg1$wald.test)^2
  efron=survival::coxph(survival::Surv(x,cens)~trt,ties="efron")
  betaef[i]=efron$coef
  varef[i]=efron$var}

h0=0.9*(exp(-c(0:(k-2))*m1/(k-1))-exp(-c(1:(k-1))*m1/(k-1)))
h0=h0/(h0+exp(-c(1:(k-1))*m1/(k-1)))
p0=exp(-c(0:(k-1))*m1/(k-1))
p0=(p0[1:(k-1)]*0.9+p0[2:k]*0.1)/2
h1=0.9*(exp(-c(0:(k-2))*2*m1/(k-1))-exp(-c(1:(k-1))*2*m1/(k-1)))
h1=h1/(h1+exp(-c(1:(k-1))*2*m1/(k-1)))
p1=exp(-2*c(0:(k-1))*m1/(k-1))
p1=(p1[1:(k-1)]*0.9+p1[2:k]*0.1)/2

fa=AsympDiscSurv(h0=h0, h1=h1,p0=p0,p1=p1)
c(fa$estimate,fa$var/(2*n))
c(mean(betaef),var(betaef),mean(varef))




