library(intRegGOF)


### Name: anovarIntReg
### Title: Integrated Regression Goodness of Fit
### Aliases: anovarIntReg print.anovarIntReg
### Keywords: models regression nonlinear goodnes of fit

### ** Examples

  n <- 50
  d <- data.frame( X1=runif(n),X2=runif(n))
  d$Y <- 1 - 2*d$X1 - 5*d$X2 + rnorm(n,sd=.125)
  a0 <- lm(Y~1,d) 
  a1 <- lm(Y~X1,d) 
  a2 <- lm(Y~X1+X2,d) 
  anovarIntReg(a0,a1,a2,B=50) 
  anovarIntReg(a0,a1,a2,B=50,INCREMENTAL=TRUE) 



