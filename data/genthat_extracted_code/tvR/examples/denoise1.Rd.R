library(tvR)


### Name: denoise1
### Title: Total Variation Denoising for Signal
### Aliases: denoise1

### ** Examples

## generate a stepped signal
x = rep(sample(1:5,10,replace=TRUE), each=50)

## add some additive white noise
xnoised = x + rnorm(length(x), sd=0.25)

## apply denoising process
xproc1 = denoise1(xnoised, method = "TVL2.IC")
xproc2 = denoise1(xnoised, method = "TVL2.MM")

## plot noisy and denoised signals
plot(xnoised, pch=19, cex=0.1, main="Noisy signal")
lines(xproc1, col="blue", lwd=2)
lines(xproc2, col="red", lwd=2)
legend("bottomleft",legend=c("Noisy","TVL2.IC","TVL2.MM"),
col=c("black","blue","red"),#' lty = c("solid", "solid", "solid"),
lwd = c(0, 2, 2), pch = c(19, NA, NA),
pt.cex = c(1, NA, NA), inset = 0.05)




