library(choplump)


### Name: choplump-package
### Title: Choplump test package
### Aliases: choplump-package
### Keywords: package

### ** Examples

set.seed(13921)
Ntotal<-200
Mtotal<-54
Z<-rep(0,Ntotal)
Z[sample(1:Ntotal,Ntotal/2,replace=FALSE)]<-1
test<-data.frame(W=c(rep(0,Ntotal-Mtotal),abs(rnorm(Mtotal))),Z=Z)
## defaults to asymptotic approximation if the number 
## of calculations of the test statistic 
## is >methodRuleParms=10^4
choplump(W~Z,data=test,use.ranks=TRUE,exact=FALSE)



