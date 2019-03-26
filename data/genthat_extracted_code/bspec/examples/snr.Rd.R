library(bspec)


### Name: snr
### Title: Compute the signal-to-noise ratio (SNR) of a signal
### Aliases: snr
### Keywords: ts

### ** Examples

# sample size and sampling resolution:
N       <- 1000
deltaT  <- 0.001

# For the coloured noise, use some AR(1) process;
# AR noise process parameters:
sigmaAR <- 1.0
phiAR   <- 0.9

# generate non-white noise
# (autoregressive AR(1) low-frequency noise):
noiseSample <- rnorm(10*N)
for (i in 2:length(noiseSample))
  noiseSample[i] <- phiAR*noiseSample[i-1] + noiseSample[i]
noiseSample <- ts(noiseSample, deltat=deltaT)

# estimate the noise spectrum:
PSDestimate <- welchPSD(noiseSample, seglength=1,
                        windowingPsdCorrection=FALSE)

# generate a (sine-Gaussian) signal:
t0    <- 0.6
phase <- 1.0
t <- ts((0:(N-1))*deltaT, deltat=deltaT, start=0)
signal <- exp(-(t-t0)^2/(2*0.01^2)) * sin(2*pi*150*(t-t0)+phase)
plot(signal)

# compute the signal's SNR:
snr(signal, psd=PSDestimate$power)



