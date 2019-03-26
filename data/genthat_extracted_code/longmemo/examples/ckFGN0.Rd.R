library(longmemo)


### Name: ckFGN0
### Title: Covariances of a Fractional Gaussian Process
### Aliases: ckFGN0
### Keywords: ts

### ** Examples

str(C.8 <- ckFGN0(50, H = 0.8))
plot(0:49, C.8, type = "h", ylim = 0:1)
plot(0:49, C.8, type = "h", log = "xy",
     main = "Log-Log  ACF for frac.GaussNoise(H = 0.8)")



