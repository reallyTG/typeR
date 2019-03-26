library(locpol)


### Name: bivNPest
### Title: Bivariate Local estimation.
### Aliases: bivDens bivReg plot.bivNpEst predict.bivNpEst epaK2d gauK2d
###   plotBivNpEstOpts mayBeBwSel
### Keywords: nonparametric smooth

### ** Examples

  n <- 100
  d <- data.frame(x=rexp(n,rate=1/2),y=rnorm(n))
  ## x is a length-biased version of an exp. dist. with rate 1.
  dDen <- bivDens(d,weig=1/d$x)
  plot(dDen,r=5)
  d <- data.frame(X1=runif(n),X2=runif(n))
  d$Y <-  exp(10*d$X1+d$X2^2) 
  dDen <- bivDens(d[,c("X1","X2")])
  plot(dDen,r=5)
  dReg <- bivReg(d[,c("X1","X2")],d$Y)
  plot(dReg,r=5)
  plot(dReg,r=5,phi=20,theta=40)



