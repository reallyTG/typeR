library(waveslim)


### Name: fdp.mle
### Title: Wavelet-based Maximum Likelihood Estimation for a Fractional
###   Difference Process
### Aliases: fdp.mle
### Keywords: ts

### ** Examples

## Figure 5.5 in Gencay, Selcuk and Whitcher (2001)
fdp.sdf <- function(freq, d, sigma2=1)
  sigma2 / ((2*sin(pi * freq))^2)^d
dB <- function(x) 10 * log10(x)
per <- function(z) {
  n <- length(z)
  (Mod(fft(z))**2/(2*pi*n))[1:(n %/% 2 + 1)]
}
data(ibm)     
ibm.returns <- diff(log(ibm))
ibm.volatility <- abs(ibm.returns)
ibm.vol.mle <- fdp.mle(ibm.volatility, "d4", 4)
freq <- 0:184/368
ibm.vol.per <- 2 * pi * per(ibm.volatility)
ibm.vol.resid <- ibm.vol.per/ fdp.sdf(freq, ibm.vol.mle$parameters[1])
par(mfrow=c(1,1), las=0, pty="m")
plot(freq, dB(ibm.vol.per), type="l", xlab="Frequency", ylab="Spectrum")
lines(freq, dB(fdp.sdf(freq, ibm.vol.mle$parameters[1],
                       ibm.vol.mle$parameters[2]/2)), col=2)



