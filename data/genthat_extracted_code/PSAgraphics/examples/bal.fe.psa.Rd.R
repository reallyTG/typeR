library(PSAgraphics)


### Name: bal.fe.psa
### Title: Fisher's Exact Test for Independence of Treatments within Strata
### Aliases: bal.fe.psa
### Keywords: htest

### ** Examples
#Everything random
categorical<-sample(4, 1000, replace = TRUE)
treatment<-sample(c(0,1), 1000, replace = TRUE)
strata<-sample(5, 1000, replace = TRUE)
bal.fe.psa(categorical, treatment, strata)

#Perfect balance on 80%, random on last 20%
categorical<-rep(sample(5,1000, replace=TRUE), 2)
treatment<-c(rep(0,1000), rep(1,1000))
strata<-sample(6, 1200, replace=TRUE)
strata<-c(strata[1:1000], strata[1:800], strata[1001:1200])
bal.fe.psa(categorical, treatment, strata)



