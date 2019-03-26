library(pairwiseCI)


### Name: pairwiseMEP
### Title: Wrapper to compute confidence intervals for multiple endpoints
### Aliases: pairwiseMEP pairwiseMEP.data.frame
### Keywords: htest

### ** Examples


x1<-rnorm(80,100,8)
x2<-rnbinom(80,mu=10, size=10)
A<-rep(c("a1","a2"), c(40,40))
B<-rep(rep(c("b1","b2"), c(20,20)), times=2)
dat<-data.frame(x1=x1,x2=x2,A=A, B=B)

test<-pairwiseMEP(x=dat, ep=c("x1","x2"), control="a1",
 f="A", by="B", method=c("Param.ratio","Negbin.ratio"))
test


plotCI(test, whichep=c("x1","x2"))

as.data.frame(test, whichep=c(1,2))

as.data.frame(test, whichep=c("x1","x2"))





