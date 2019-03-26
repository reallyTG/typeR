library(signal)


### Name: cheb1ord
### Title: Chebyshev type-I filter order and cutoff
### Aliases: cheb1ord
### Keywords: math

### ** Examples

Fs <- 10000
chord <- cheb1ord(1000/(Fs/2), 1200/(Fs/2), 0.5, 29)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)")
ch1 <- cheby1(chord)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)",
     col = "red", ylim = c(-10,0), xlim = c(0,2000))
hf <- freqz(ch1, Fs = Fs)
lines(hf$f, 20*log10(abs(hf$h)))



