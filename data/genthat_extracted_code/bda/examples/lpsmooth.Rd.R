library(bda)


### Name: lpsmooth
### Title: non-parametric regression
### Aliases: lpsmooth lpsmooth.default lpsmooth.histogram lpsmooth.bdata
###   print.smooth plot.smooth lines.smooth
### Keywords: smooth

### ** Examples


 x <- rnorm(100,34.5,1.5)
 e <- rnorm(100,0,2)
 y <- (x-32)^2 + e
 out <- lpsmooth(y,x)
 out
 plot(out, type='l', scb=TRUE)
 x0 <- seq(min(x),max(x),length=100)
 y0 <- (x0-32)^2
 lines(x0, y0, col=2)
 points(x, y, pch="*", col=4)


 


