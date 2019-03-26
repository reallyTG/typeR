library(wavethresh)


### Name: rfft
### Title: Real Fast Fourier transform
### Aliases: rfft
### Keywords: math

### ** Examples

x <- seq(from=0, to=2*pi, length=150)
s1 <- sin(10*x)
s2 <- sin(7*x)
s <- s1 + s2
w <- rfft(s)
## Not run: ts.plot(w)
#
# Should see two peaks, corresponding to the two sines at different frequencies
#



