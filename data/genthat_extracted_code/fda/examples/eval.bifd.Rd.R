library(fda)


### Name: eval.bifd
### Title: Values a Two-argument Functional Data Object
### Aliases: eval.bifd
### Keywords: smooth

### ** Examples

# every-other-day basis to save test time
daybasis   <- create.fourier.basis(c(0,365), 183)
harmLcoef  <- c(0,(2*pi/365)^2,0)
harmLfd    <- vec2Lfd(harmLcoef, c(0,365))
templambda <- 1.0
tempfdPar  <- fdPar(daybasis, harmLfd, lambda=1)
tempfd     <- smooth.basis(day.5,
          CanadianWeather$dailyAv[,,"Temperature.C"], tempfdPar)$fd
#    define the variance-covariance bivariate fd object
tempvarbifd <- var.fd(tempfd)
#    evaluate the variance-covariance surface and plot
weektime    <- seq(0,365,len=53)
tempvarmat  <- eval.bifd(weektime,weektime,tempvarbifd)
#    make a perspective plot of the variance function
persp(tempvarmat)



