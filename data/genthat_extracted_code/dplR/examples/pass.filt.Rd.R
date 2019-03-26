library(dplR)


### Name: pass.filt
### Title: Low-pass, high-pass, band-pass, and stop-pass filtering
### Aliases: pass.filt
### Keywords: smooth

### ** Examples

data("co021")
x <- na.omit(co021[, 1])

# 20-year low-pass filter -- note freq is passed in
bSm <- pass.filt(x, W=0.05, type="low", method="Butterworth")
cSm <- pass.filt(x, W=0.05, type="low", method="ChebyshevI")
plot(x, type="l", col="grey")
lines(bSm, col="red")
lines(cSm, col="blue")

# 20-year high-pass filter -- note period is passed in
bSm <- pass.filt(x, W=20, type="high")
plot(x, type="l", col="grey")
lines(bSm, col="red")

# 20 to 100-year band-pass filter -- note freqs are passed in
bSm <- pass.filt(x, W=c(0.01, 0.05), type="pass")
cSm <- pass.filt(x, W=c(0.01, 0.05), type="pass", method="ChebyshevI")
plot(x, type="l", col="grey")
lines(bSm, col="red")
lines(cSm, col="blue")

# 20 to 100-year stop-pass filter -- note periods are passed in
cSm <- pass.filt(x, W=c(20, 100), type="stop", method="ChebyshevI")
plot(x, type="l", col="grey")
lines(cSm, col="red")



