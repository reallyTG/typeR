library(hht)


### Name: HilbertTransform
### Title: The Hilbert transform
### Aliases: HilbertTransform
### Keywords: ts

### ** Examples

tt <- seq(1000) * 0.01
sig <- sin(pi * tt)
asig <- HilbertTransform(sig)
plot(tt, sig, xlim = c(0, 12))
lines(tt, Re(asig), col = "green")
lines(tt, Im(asig), col = "red")
legend("topright", col = c("black", "green", "red"), 
lty = c(NA, 1, 1), pch = c(1, NA, NA), 
legend = c("Signal", "Real", "Imaginary"))




