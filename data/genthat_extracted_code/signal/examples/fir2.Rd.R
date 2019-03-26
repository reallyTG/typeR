library(signal)


### Name: fir2
### Title: FIR filter generation
### Aliases: fir2
### Keywords: math

### ** Examples

f <- c(0, 0.3, 0.3, 0.6, 0.6, 1)
m <- c(0, 0, 1, 1/2, 0, 0)
fh <- freqz(fir2(100, f, m))
op <- par(mfrow = c(1, 2))
plot(f, m, type = "b", ylab = "magnitude", xlab = "Frequency")
lines(fh$f / pi, abs(fh$h), col = "blue")
# plot in dB:
plot(f, 20*log10(m+1e-5), type = "b", ylab = "dB", xlab = "Frequency")
lines(fh$f / pi, 20*log10(abs(fh$h)), col = "blue")
par(op)



