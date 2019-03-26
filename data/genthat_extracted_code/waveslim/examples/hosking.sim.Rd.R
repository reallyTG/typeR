library(waveslim)


### Name: hosking.sim
### Title: Generate Stationary Gaussian Process Using Hosking's Method
### Aliases: hosking.sim
### Keywords: ts

### ** Examples

dB <- function(x) 10 * log10(x)
per <- function (z) {
  n <- length(z)
  (Mod(fft(z))^2/(2 * pi * n))[1:(n%/%2 + 1)]
}
spp.sdf <- function(freq, delta, omega)
  abs(2 * (cos(2*pi*freq) - cos(2*pi*omega)))^(-2*delta)
data(acvs.andel8)
n <- 1024
## Not run: 
##D z <- hosking.sim(n, acvs.andel8[,2])
##D per.z <- 2 * pi * per(z)
##D par(mfrow=c(2,1), las=1)
##D plot.ts(z, ylab="", main="Realization of a Seasonal Long-Memory Process")
##D plot(0:(n/2)/n, dB(per.z), type="l", xlab="Frequency", ylab="dB",
##D      main="Periodogram")
##D lines(0:(n/2)/n, dB(spp.sdf(0:(n/2)/n, .4, 1/12)), col=2)
## End(Not run)



