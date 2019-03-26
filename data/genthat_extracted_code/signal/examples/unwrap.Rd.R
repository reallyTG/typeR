library(signal)


### Name: unwrap
### Title: Unwrap radian phases
### Aliases: unwrap
### Keywords: math

### ** Examples

phase <- c(seq(0, 2*pi, length=500), seq(0, 2*pi, length=500))
plot(phase, type = "l", ylim = c(0, 4*pi))
lines(unwrap(phase), col = "blue")



