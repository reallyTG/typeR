library(PSAgraphics)


### Name: bal.cs.psa
### Title: Balance for Categorical Covariate: Random Strata as part of a
###   PSA
### Aliases: bal.cs.psa
### Keywords: htest

### ** Examples
#Everything random
categorical<-sample(4,1000,replace=TRUE)
treatment<-sample(c(0,1),1000,replace=TRUE)
strata<-sample(5,1000,replace=TRUE)
bal.cs.psa(categorical,treatment,strata)

#Perfect balance on 80%, random on last 20%
categorical<-rep(sample(5,1000,replace=TRUE),2)
treatment<-c(rep(0,1000),rep(1,1000))
strat<-sample(6,1200,replace=TRUE)
strat<-c(strat[1:1000],strat[1:800],strat[1001:1200])
bal.cs.psa(categorical,treatment,strat,B=200)




