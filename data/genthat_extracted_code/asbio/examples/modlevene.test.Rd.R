library(asbio)


### Name: modlevene.test
### Title: Modified Levene's test
### Aliases: modlevene.test print.mltest
### Keywords: univar htest

### ** Examples

eggs<-c(11,17,16,14,15,12,10,15,19,11,23,20,18,17,27,33,22,26,28)
trt<-as.factor(c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,4,4,4,4,4))
lm1<-lm(eggs~trt)
modlevene.test(residuals(lm1),trt)




