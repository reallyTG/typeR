library(fields)


### Name: qsreg
### Title: Quantile or Robust spline regression
### Aliases: qsreg
### Keywords: smooth

### ** Examples


     # fit a CV  quantile spline
     fit50<- qsreg(rat.diet$t,rat.diet$con)
     # (default is .5 so this is an estimate of the conditional median)
     # control group of rats.
     plot( fit50)
     predict( fit50)
     # predicted values at data points
     xg<- seq(0,110,,50)
     plot( fit50$x, fit50$y)
     lines( xg, predict( fit50, xg))

     # A robust fit to rat diet data
     # 
     SC<- .5* median(abs((rat.diet$con- median(rat.diet$con))))
     fit.robust<- qsreg(rat.diet$t,rat.diet$con, sc= SC)
     plot( fit.robust)

     # The global GCV function suggests little smoothing so 
     # try the local
     # minima with largest lambda instead of this default value.
     # one should should consider redoing the three quantile fits in this
     # example after looking at the cv functions and choosing a good value for
     #lambda
     # for example
     lam<- fit50$cv.grid[,1]
     tr<- fit50$cv.grid[,2]
     # lambda close to df=6
     lambda.good<- max(lam[tr>=6])
     fit50.subjective<-qsreg(rat.diet$t,rat.diet$con, lam= lambda.good)
     fit10<-qsreg(rat.diet$t,rat.diet$con, alpha=.1, nstep.cv=200)
     fit90<-qsreg(rat.diet$t,rat.diet$con, alpha=.9, nstep.cv=200)
     # spline fits at 50 equally spaced points
     sm<- cbind(
 
     predict( fit10, xg),
     predict( fit50.subjective, xg),predict( fit50, xg),
     predict( fit90, xg))
 
     # and now zee data ...
     plot( fit50$x, fit50$y)
     # and now zee quantile splines at 10% 50% and 90%.
     #
     matlines( xg, sm, col=c( 3,3,2,3), lty=1) # the spline
  



