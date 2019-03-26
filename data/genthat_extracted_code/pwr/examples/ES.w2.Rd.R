library(pwr)


### Name: ES.w2
### Title: Effect size calculation in the chi-squared test for association
### Aliases: ES.w2
### Keywords: htest

### ** Examples

prob<-matrix(c(0.225,0.125,0.125,0.125,0.16,0.16,0.04,0.04),nrow=2,byrow=TRUE)
prob
ES.w2(prob)
pwr.chisq.test(w=ES.w2(prob),df=(2-1)*(4-1),N=200)



