library(tatest)


### Name: ta.test
### Title: t_alpha-test for testing difference between two conditions with
###   small samples
### Aliases: ta.test
### Keywords: rhov ttest

### ** Examples

X<-c(112,122,108,127)
Y<-c(302, 314,322,328)
dat<-cbind(X,Y)
ta.test(X=dat,nci=NULL, na=4,nb=4, eqv=TRUE, 
alpha=0.05, LOG="NULL", alternative = "two.sided")

data(Ecadherin)
res<-ta.test(X=Ecadherin[1:2000,],nci=1, na=3,nb=3, eqv=TRUE, 
LOG="LOG2", alternative = "two.sided")



