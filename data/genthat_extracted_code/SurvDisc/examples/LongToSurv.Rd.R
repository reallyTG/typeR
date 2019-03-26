library(SurvDisc)


### Name: LongToSurv
### Title: Longitudinal To Survival Function
### Aliases: LongToSurv

### ** Examples

mu.AGE = 38.582
mu.lbtkv = 6.9276
mu.base.leGFR = 4.2237
var.AGE = 220.73
var.lbtkv = 0.46848
var.base.leGFR=0.19770
cov.AGE.lbtkv = 3.4075
cov.AGE.leGFR = -4.5065
cov.lbtkv.leGFR = -0.16303
sig.intercept=0.03975
sig.time=0.04505
sig.cor=0.008
res.sd=0.11470307/sqrt(2)

M=c(mu.AGE,mu.lbtkv,mu.base.leGFR,0,0,0)
V=diag(c(var.AGE,var.lbtkv,var.base.leGFR+res.sd^2,res.sd^2,sig.intercept^2,sig.time^2))
V[1,2] = V[2,1] = cov.AGE.lbtkv
V[1,3] = V[3,1] = cov.AGE.leGFR
V[2,3] = V[3,2] = cov.lbtkv.leGFR
V[3,4] = V[4,3] = V[4,4]
V[5,6] = V[6,5] = sig.cor*sig.intercept*sig.time
L=c(18,6.9,3.9,-Inf,-Inf,-Inf)
U=c(40,8,5,Inf,Inf,Inf)
time=c(1:12)/4

p0f=function(x,t) {
  fixed.time=-0.337166
  fixed.age=0.0008176
  fixed.lbtkv=-0.02409
  fixed.leGFR0=0.09591
  trt.acute=-0.047759
  trt.chronic=0.0191574
  res.sd=0.11470307/sqrt(2)
  pnorm((log(0.7)-as.vector(x[5]+outer(x[6]+fixed.age*x[1]+fixed.lbtkv*x[2]+
  fixed.leGFR0*(x[3]-x[4])+fixed.time,t)-x[4]))/res.sd)
}

p1f=function(x,t) {
  fixed.time=-0.337166
  fixed.age=0.0008176
  fixed.lbtkv=-0.02409
  fixed.leGFR0=0.09591
  trt.acute=-0.047759
  trt.chronic=0.0191574
  res.sd=0.11470307/sqrt(2)
  pnorm((log(0.7)-as.vector(x[5]+trt.acute+outer(x[6]+fixed.age*x[1]+fixed.lbtkv*x[2]+
  fixed.leGFR0*(x[3]-x[4])+fixed.time+trt.chronic,t)-x[4]))/res.sd)
}

LTS1=LongToSurv(M,V,L,U,time,p0f,p1f,nsim=100) #nsim much larger than 100 is recommended
LTS1
#LTS2=LongToSurv(M,V,L,U,time,p0f,p1f,method="analytic")
#LTS2



