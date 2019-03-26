library(rhnerm)


### Name: RHNERM
### Title: Estimation of random heteroscedastic nested error regression
###   models
### Aliases: RHNERM

### ** Examples

#generate data
set.seed(1234)
beta=c(1,1); la=1; tau=c(8,4)
m=20; ni=rep(3,m); N=sum(ni)
X=cbind(rep(1,N),rnorm(N))

mu=beta[1]+beta[2]*X[,2]
sig=1/rgamma(m,tau[1]/2,tau[2]/2); v=rnorm(m,0,sqrt(la*sig))
y=c()
cum=c(0,cumsum(ni))
for(i in 1:m){
  term=(cum[i]+1):cum[i+1]
  y[term]=mu[term]+v[i]+rnorm(ni[i],0,sqrt(sig[i]))
}

#fit the random heteroscedastic nested error regression
C=cbind(rep(1,m),rnorm(m))
fit=RHNERM(y,X,ni,C)
fit



