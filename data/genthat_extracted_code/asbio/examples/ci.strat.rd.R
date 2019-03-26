library(asbio)


### Name: ci.strat
### Title: Confidence intervals for stratified random samples.
### Aliases: ci.strat
### Keywords: univar htest

### ** Examples

#Data from Siniff and Skoog (1964)
Caribou<-data.frame(Stratum=c("A","B","C","D","E","F"),N.h=c(400,30,61,18,70,120),
n.h=c(98,10,37,6,39,21),x.bar.h=c(24.1,25.6,267.6,179,293.7,33.2),
var.h=c(5575,4064,347556,22798,123578,9795))
attach(Caribou)
ci.strat(data,strat=Stratum,N.h=N.h,conf=.95,summarized=TRUE,use.t=FALSE,n.h=n.h,
x.bar.h=x.bar.h,var.h=var.h)



