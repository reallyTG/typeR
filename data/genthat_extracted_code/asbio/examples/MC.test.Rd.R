library(asbio)


### Name: MC.test
### Title: Monte Carlo hypothesis testing for two samples.
### Aliases: MC.test
### Keywords: htest univar

### ** Examples

Y<-c(runif(100,1,3),runif(100,1.2,3.2))
X<-factor(c(rep(1,100),rep(2,100)))
MC.test(Y,X,alternative="less")



