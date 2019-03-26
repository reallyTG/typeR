library(pwr)


### Name: ES.w1
### Title: Effect size calculation in the chi-squared test for goodness of
###   fit
### Aliases: ES.w1
### Keywords: htest

### ** Examples

## Exercise 7.1 p. 249 from Cohen 
P0<-rep(1/4,4)
P1<-c(0.375,rep((1-0.375)/3,3))
ES.w1(P0,P1)
pwr.chisq.test(w=ES.w1(P0,P1),N=100,df=(4-1))



