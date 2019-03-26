library(wavethresh)


### Name: cthresh
### Title: Estimate real signal using complex-valued wavelets
### Aliases: cthresh
### Keywords: manip

### ** Examples

#
# Make up some noisy data
#
y <- example.1()$y
ynoise <- y + rnorm(512, sd=0.1)
#
# Do complex-valued wavelet shrinkage with decimated wavelets
#
est1 <- cthresh(ynoise, TI=FALSE)
#
# Do complex-valued wavelet shrinkage with nondecimated wavelets
#
est2 <- cthresh(ynoise, TI=TRUE)
#
#
#
plot(1:512, y, lty=2, type="l")
lines(1:512, est1, col=2)
lines(1:512, est2, col=3)



