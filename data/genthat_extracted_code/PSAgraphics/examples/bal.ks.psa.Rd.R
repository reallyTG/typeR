library(PSAgraphics)


### Name: bal.ks.psa
### Title: Kolgomorov-Smirnov 2 sample tests for multiple strata
### Aliases: bal.ks.psa
### Keywords: htest

### ** Examples

continuous<-rnorm(1000)
treatment<-sample(c(0,1),1000,replace=TRUE)
strata<-sample(5,1000,replace=TRUE)
bal.ks.psa(continuous,treatment,strata)



