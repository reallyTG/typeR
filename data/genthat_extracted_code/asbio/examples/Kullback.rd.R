library(asbio)


### Name: Kullback
### Title: Kullback test for equal covariance matrices.
### Aliases: Kullback print.kback
### Keywords: multivariate htest

### ** Examples

Y1<-rnorm(100,10,2)
Y2<-rnorm(100,15,2)
Y3<-rnorm(100,20,2)
Y<-cbind(Y1,Y2,Y3)
X<-factor(c(rep(1,50),rep(2,50)))
Kullback(Y,X)



