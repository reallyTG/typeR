library(intRegGOF)


### Name: plot
### Title: Integrated Regression Goodness of Fit graphical output
### Aliases: plotAsIntRegGOF pointsAsIntRegGOF linesAsIntRegGOF
### Keywords: models regression nonlinear goodnes of fit

### ** Examples

  n <- 50
  d <- data.frame( X1=runif(n),X2=runif(n))
  d$Y <- 1 + 2*d$X1 + rnorm(n,sd=.125)
  par(ask=TRUE)
  plot( d ) 
  plotAsIntRegGOF(lm(Y~X1+X2,d),covar="X1") 
  plotAsIntRegGOF(a <- lm(Y~X1-1,d)) 
  plotAsIntRegGOF(a,c("X1")) 
  plotAsIntRegGOF(a,0) 
  plotAsIntRegGOF(a,fitted(a)) 
  par(ask=FALSE)



