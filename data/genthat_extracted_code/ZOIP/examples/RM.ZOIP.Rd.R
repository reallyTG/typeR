library(ZOIP)


### Name: RM.ZOIP
### Title: ZOIP regression with fixed efects
### Aliases: RM.ZOIP

### ** Examples


#Test 1--------------------------------------------------
library(ZOIP)
library(boot)
library(numDeriv)
n<-1000
x1<-stats::runif(n)
x2<-stats::runif(n)

b1<-0.3
b2<--0.5
b3<-0.9
sigma_i<-exp(b1+b2*x1+b3*x2)

c1<-0.2
c2<--1
c3<-0.1
mu_i<-exp(c1+c2*x1)

d1<-0.07
p0_i<-rep(d1,length(n))

e1<-0.02
e2<--4
p1_i<-boot::inv.logit(e1+e2*x2)

param<-cbind(mu_i,sigma_i,p0_i,p1_i)

system.time(y_i<-apply(param,1,function(x){rZOIP(1,mu=x[1],sigma=x[2],
                                                 p0=x[3],p1=x[4],family='Original')}))
data<-as.data.frame(cbind(y_i,x1,x2))

formula.mu=y_i~x1
formula.sigma=~x1+x2
formula.p0=~1
formula.p1=~x2
link=c('log','log','identity','logit')
family='Original'
mod<-RM.ZOIP(formula.mu=formula.mu,formula.sigma=formula.sigma,formula.p0=formula.p0,
             formula.p1=formula.p1,data=data,link=link,family=family)
mod
summary(mod)





