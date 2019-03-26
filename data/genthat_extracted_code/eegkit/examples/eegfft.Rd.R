library(eegkit)


### Name: eegfft
### Title: Fast Fourier Transform of EEG Data
### Aliases: eegfft

### ** Examples


##########   EXAMPLE   ##########

### Data Generation ###

# parameters for signal
Fs <- 1000                             # 1000 Hz signal
s <- 3                                 # 3 seconds of data
t <- seq(0, s - 1/Fs, by = 1/Fs)       # time sequence
n <- length(t)                         # number of data points
freqs <- c(1, 5, 10, 20)               # frequencies
amp <- c(2, 1.5, 3, 1.75)              # strengths (amplitudes)
phs <- c(0, pi/6, pi/4, pi/2)          # phase shifts

# create data generating signals
mu <- rep(0, n)
for(j in 1:length(freqs)){
  mu <- mu + amp[j] * sin(2*pi*t*freqs[j] + phs[j])
}
set.seed(1)                           # set random seed
e <- rnorm(n)                         # Gaussian error
y <- mu + e                           # data = mean + error


### FFT of Noise-Free Data ###

# fft of noise-free data
ef <- eegfft(mu, Fs = Fs, upper = 40)
head(ef)
ef[ef$strength > 0.25,]

# plot frequency strength
par(mfrow = c(1,2))
plot(x = ef$frequency, y = ef$strength, t = "b",
     xlab = "Frequency (Hz)", 
     ylab = expression("Strength (" * mu * "V)"),
     main = "FFT of Noise-Free Data")

# compare to data generating parameters
cbind(amp, ef$strength[ef$strength > 0.25])
cbind(phs - pi/2, ef$phase[ef$strength > 0.25])


### FFT of Noisy Data ###

# fft of noisy data
ef <- eegfft(y, Fs = Fs, upper = 40)
head(ef)
ef[ef$strength > 0.25,]

# plot frequency strength
plot(x = ef$frequency, y = ef$strength, t = "b",
     xlab = "Frequency (Hz)", 
     ylab = expression("Strength (" * mu * "V)"),
     main = "FFT of Noisy Data")

# compare to data generating parameters
cbind(amp, ef$strength[ef$strength > 0.25])
cbind(phs - pi/2, ef$phase[ef$strength > 0.25])




