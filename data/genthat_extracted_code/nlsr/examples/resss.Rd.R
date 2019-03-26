library(nlsr)


### Name: resss
### Title: Compute sum of squares from residuals via the residual function.
### Aliases: resss
### Keywords: nonlinear least squares

### ** Examples

shobbs.res  <-  function(x){ # scaled Hobbs weeds problem -- residual
# This variant uses looping
    if(length(x) != 3) stop("hobbs.res -- parameter vector n!=3")
    y  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
             38.558, 50.156, 62.948, 75.995, 91.972)
    tt  <-  1:12
    res  <-  100.0*x[1]/(1+x[2]*10.*exp(-0.1*x[3]*tt)) - y
}
 
st  <-  c(b1=1, b2=1, b3=1)

firstss<-resss(st, shobbs.res)
# The sum of squares of the scaled Hobbs function at parameters
st
firstss
# now illustrate how to get solution via optimization

tf <- function(prm){
  val <- resss(prm, shobbs.res)
}
testop <- optim(st, tf, control=list(trace=1))
testop



