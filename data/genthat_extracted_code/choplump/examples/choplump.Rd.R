library(choplump)


### Name: choplump
### Title: Choplump test
### Aliases: choplump choplump.default choplump.formula
### Keywords: htest

### ** Examples

set.seed(1)
Ntotal<-200
Mtotal<-12
Z<-rep(0,Ntotal)
Z[sample(1:Ntotal,Ntotal/2,replace=FALSE)]<-1
test<-data.frame(W=c(rep(0,Ntotal-Mtotal),abs(rnorm(Mtotal))),Z=Z)
## defaults to asymptotic approximation if 
## the number of calculations of the test 
## statistic is greater than parms
## see help for methodRule1
choplump(W~Z,data=test,use.ranks=TRUE)
## alternate form
cout<-choplump(test$W[test$Z==0],test$W[test$Z==1],use.ranks=TRUE,exact=TRUE)
cout
cout$p.values



