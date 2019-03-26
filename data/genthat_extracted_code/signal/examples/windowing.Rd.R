library(signal)


### Name: Windowing functions
### Title: Windowing functions
### Aliases: bartlett blackman boxcar flattopwin gausswin hamming hanning
###   triang
### Keywords: math

### ** Examples

n <- 51
op <- par(mfrow = c(3,3))
plot(bartlett(n), type = "l", ylim = c(0,1))
plot(blackman(n), type = "l", ylim = c(0,1))
plot(boxcar(n), type = "l", ylim = c(0,1))
plot(flattopwin(n), type = "l", ylim = c(0,1))
plot(gausswin(n, 5), type = "l", ylim = c(0,1))
plot(hanning(n), type = "l", ylim = c(0,1))
plot(hamming(n), type = "l", ylim = c(0,1))
plot(triang(n), type = "l", ylim = c(0,1))
par(op)



