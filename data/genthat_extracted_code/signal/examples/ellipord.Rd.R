library(signal)


### Name: ellipord
### Title: Elliptic filter order and cutoff
### Aliases: ellipord
### Keywords: math

### ** Examples

Fs <- 10000
elord <- ellipord(1000/(Fs/2), 1200/(Fs/2), 0.5, 29)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)")
el1 <- ellip(elord)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)",
     col = "red", ylim = c(-35,0), xlim = c(0,2000))
lines(c(5000, 1200, 1200, 5000, 5000), c(-1000, -1000, -29, -29, -1000),
      col = "red")
hf <- freqz(el1, Fs = Fs)
lines(hf$f, 20*log10(abs(hf$h)))



