library(fda)


### Name: center.fd
### Title: Center Functional Data
### Aliases: center.fd
### Keywords: smooth

### ** Examples

daytime    <- (1:365)-0.5
daybasis   <- create.fourier.basis(c(0,365), 365)
harmLcoef  <- c(0,(2*pi/365)^2,0)
harmLfd    <- vec2Lfd(harmLcoef, c(0,365))
templambda <- 0.01
tempfdPar  <- fdPar(daybasis, harmLfd, templambda)

# do not run on CRAN because it takes too long.
if(!CRAN()){
tempfd     <- smooth.basis(daytime,
       CanadianWeather$dailyAv[,,"Temperature.C"], tempfdPar)$fd

tempctrfd  <- center.fd(tempfd)

plot(tempctrfd, xlab="Day", ylab="deg. C",
     main = "Centered temperature curves")
}



