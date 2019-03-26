library(fields)


### Name: sreg
### Title: Cubic smoothing spline regression
### Aliases: sreg predict.sreg
### Keywords: smooth

### ** Examples

# fit a GCV spline to  
# control group of rats.  
fit<- sreg(rat.diet$t,rat.diet$con)
summary( fit)

set.panel(2,2)
plot(fit)                       # four diagnostic plots of  fit 
set.panel()

predict( fit) # predicted values at data points 

xg<- seq(0,110,,50) 
sm<-predict( fit, xg) # spline fit at 50 equally spaced points 
der.sm<- predict( fit, xg, deriv=1) # derivative of spline fit 
set.panel( 2,1) 
plot( fit$x, fit$y) # the data 
lines( xg, sm) # the spline 
plot( xg,der.sm, type="l") # plot of estimated derivative 
set.panel() # reset panel to 1 plot


# the same fit using  the thin plate spline numerical algorithms 
# sreg does not scale the obs so instruct Tps not to sacel either
# this will make lambda comparable within factor of n. 

   fit.tps<-Tps( rat.diet$t,rat.diet$con, scale="unscaled")
   summary( fit.tps) 

# compare sreg and Tps results to show the adjustment to lambda.

   predict( fit)-> look
   predict( fit.tps, lambda=fit$lambda*fit$N)-> look2
   test.for.zero( look, look2) # silence means it checks to 1e-8

# finding approximate standard errors at observations

SE<- fit$shat.GCV*sqrt(fit$diagA)

# compare to predictSE( fit.tps) differences are due to 
# slightly different lambda values and using shat.MLE instad of shat.GCV
#

# 95% pointwise prediction intervals
Zvalue<-  qnorm(.0975)
upper<- fit$fitted.values + Zvalue* SE
lower<- fit$fitted.values - Zvalue* SE
#
# conservative, simultaneous Bonferroni bounds
#
ZBvalue<-  qnorm(1- .025/fit$N)
upperB<- fit$fitted.values + ZBvalue* SE
lowerB<- fit$fitted.values - ZBvalue* SE
#
# take a look

plot( fit$x, fit$y)
lines( fit$predicted, lwd=2)
matlines( fit$x, 
cbind( lower, upper, lowerB, upperB), type="l", col=c( 2,2,4,4), lty=1)
title( "95 pct pointwise  and simultaneous intervals")
# or try the more visually  honest:
plot( fit$x, fit$y)
lines( fit$predicted, lwd=2)
segments(  fit$x, lowerB, fit$x, upperB, col=4)
segments(  fit$x, lower, fit$x, upper, col=2, lwd=2)
title( "95 pct pointwise  and simultaneous intervals")

set.panel( 1,1)



