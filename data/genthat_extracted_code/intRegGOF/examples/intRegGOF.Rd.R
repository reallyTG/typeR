library(intRegGOF)


### Name: intRegGOF
### Title: Integrated Regression Goodness of Fit
### Aliases: intRegGOF print.intRegGOF
### Keywords: models regression nonlinear goodnes of fit

### ** Examples

n <- 50
d <- data.frame( X1=runif(n),X2=runif(n))
d$Y <- 1 + 2*d$X1 + rnorm(n,sd=.125)
plot( d ) 
intRegGOF(lm(Y~X1+X2,d),B=99)
intRegGOF(a <- lm(Y~X1-1,d),B=99) 
intRegGOF(a,c("X1","X2"),B=99) 
intRegGOF(a,~X2+X1,B=99) 



