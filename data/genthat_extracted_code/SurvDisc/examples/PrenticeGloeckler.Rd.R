library(SurvDisc)


### Name: PrenticeGloeckler.test
### Title: Regression for Grouped Survival Data Function
### Aliases: PrenticeGloeckler.test

### ** Examples

set.seed(1234)
nsim=1
n=250
tn=2*n
k=0.1*tn
betaef=rep(0,nsim)
betapg=rep(0,nsim)
cens=rep(1,2*n)
trt=c(rep(0,n),rep(1,n))

for (i in 1:nsim) {
  x=rexp(tn,1)
  x[(n+1):tn]=x[(n+1):tn]/2
  m1=max(x[(n+1):tn])
  x=ceiling(x*(k-1)/m1)
  x[(n+1):tn]=pmin(x[(n+1):tn],k-1)
  x[1:n]=pmin(x[1:n],k)
  pg1=PrenticeGloeckler.test(x,cens,trt,k)
  betapg[i]=pg1$coefficient
  betaef[i]=survival::coxph(survival::Surv(x,cens)~trt,ties="efron")$coef}
mean(betaef)
mean(betapg)



