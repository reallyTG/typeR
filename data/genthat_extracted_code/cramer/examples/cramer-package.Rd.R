library(cramer)


### Name: cramer-packge
### Title: Cramer-Test for uni- and multivariate two-sample-problem
### Aliases: cramer-package cramer cramer.test phiBahr phiCramer phiFracA
###   phiFracB phiLog print.cramertest
### Keywords: nonparametric multivariate htest

### ** Examples

# comparison of two univariate normal distributions
x<-rnorm(20,mean=0,sd=1)
y<-rnorm(50,mean=0.5,sd=1)
cramer.test(x,y)

# comparison of two multivariate normal distributions with permutation test:
# library "MASS" for multivariate routines (included in package "VR")
 
# library(MASS)
# x<-mvrnorm(n=20,mu=c(0,0),Sigma=diag(c(1,1)))
# y<-mvrnorm(n=50,mu=c(0.3,0),Sigma=diag(c(1,1)))
# cramer.test(x,y,sim="permutation")

# comparison of two univariate normal distributions with Bahrs Kernel
phiBahr<-function(x) return(1-exp(-x/2))
x<-rnorm(20,mean=0,sd=1)
y<-rnorm(50,mean=0,sd=2)
cramer.test(x,y,sim="eigenvalue",kernel="phiBahr")




