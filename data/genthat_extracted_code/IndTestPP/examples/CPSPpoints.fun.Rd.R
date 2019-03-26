library(IndTestPP)


### Name: CPSPpoints.fun
### Title: Calculates the occurrence times of the three indicator processes
###   of a bivariate Common Poisson shock process
### Aliases: CPSPpoints.fun

### ** Examples


set.seed(123)
X<-as.numeric(runif(100)<0.10)
set.seed(124)
Y<-as.numeric(runif(100)<0.15)

aux<-CPSPpoints.fun(X=X,Y=Y)



