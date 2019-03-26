library(bspec)


### Name: matchedfilter
### Title: Filter a noisy time series for a signal of given shape
### Aliases: matchedfilter studenttfilter
### Keywords: ts robust

### ** Examples

# sample size and sampling resolution:
deltaT  <- 0.001
N       <- 1000

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

# show noise and noise PSD:
par(mfrow=c(2,1))
  plot(noiseSample, main="noise sample")
  plot(PSDestimate$freq, PSDestimate$pow, log="y", type="l",
       main="noise PSD", xlab="frequency", ylab="power")
par(mfrow=c(1,1))

# generate actual data:
noise <- rnorm(N)
for (i in 2:length(noise))
  noise[i] <- phiAR*noise[i-1] + noise[i]
noise <- ts(noise, start=0, deltat=deltaT)

# the "sine-Gaussian" signal to be injected into the noise:
t0    <- 0.6
phase <- 1.0
signal <- exp(-(time(noise)-t0)^2/(2*0.01^2)) * sin(2*pi*150*(time(noise)-t0)+phase)
plot(signal)

t <- seq(-0.1, 0.1, by=deltaT)
# the signal's orthogonal (sine- and cosine-) basis waveforms:
signalSine   <- exp(-t^2/(2*0.01^2)) * sin(2*pi*150*t)
signalCosine <- exp(-t^2/(2*0.01^2)) * sin(2*pi*150*t+pi/2)
signalBasis <- ts(cbind("sine"=signalSine, "cosine"=signalCosine),
                  start=-0.1, deltat=deltaT)
plot(signalBasis[,1], col="red", main="the signal basis")
lines(signalBasis[,2], col="green")
# (the sine- and cosine- components allow to span
#  signals of arbitrary phase)
# Note that "signalBasis" may be shorter than "data",
# but must be of the same time resolution.


# compute the signal's signal-to-noise ration (SNR):
signalSnr <- snr(signal, psd=PSDestimate$pow)

# scale signal to SNR = 6:
rho <- 6
data <- noise + signal * (rho/signalSnr)
data <- data * tukeywindow(length(data))
# Note that the data has (and should have!)
# the same resolution, size, and windowing applied
# as in the PSD estimation step.

# compute filters:
f1 <- matchedfilter(data, signalBasis, PSDestimate$power)
f2 <- studenttfilter(data, signalBasis, PSDestimate$power)

# illustrate the results:
par(mfrow=c(3,1))
  plot(data, ylab="", main="data")
  lines(signal* (rho/signalSnr), col="green")
  legend(0,max(data),c("noise + signal","signal only"),
         lty="solid", col=c("black","green"), bg="white")

  plot(signal * (rho/signalSnr), xlim=c(0.55, 0.65), ylab="",
       main="original & recovered signals")
  lines(f1$reconstruction, col="red")
  lines(f2$reconstruction, col="blue")
  abline(v=c(f1$tHat,f2$tHat), col=c("red", "blue"), lty="dashed")
  legend(0.55, max(signal*(rho/signalSnr)),
         c("injected signal","best-fitting signal (Gaussian model)",
           "best-fitting signal (Student-t model)"),
         lty="solid", col=c("black","red","blue"), bg="white")

  plot(f1$maxLLRseries, type="n", ylim=c(0, f1$maxLLR),
       main="profile likelihood (Gaussian model)",
       ylab="maximized (log-) likelihood ratio")
  lines(f1$maxLLRseries, col="grey")
  lines(window(f1$maxLLRseries, start=f1$timerange[1], end=f1$timerange[2]))
  abline(v=f1$timerange, lty="dotted")
  lines(c(f1$tHat,f1$tHat,-1), c(0,f1$maxLLR,f1$maxLLR), col="red", lty="dashed")
par(mfrow=c(1,1))



