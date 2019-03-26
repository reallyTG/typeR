library(Renext)


### Name: GPD
### Title: Generalised Pareto Distribution
### Aliases: GPD dGPD pGPD qGPD rGPD hGPD HGPD
### Keywords: distribution

### ** Examples

qGPD(p = c(0, 1), shape = -0.2)
shape <- -0.3
xlim <- qGPD(p = c(0, 1), shape = shape)
x <- seq(from = xlim[1], to = xlim[2], length.out = 100)
h <- hGPD(x, shape = shape)
plot(x, h, type = "o", main = "hazard rate for shape < 0")
shape <- 0.2
xlim <- qGPD(p = c(0, 1 - 1e-5), shape = shape)
x <- seq(from = xlim[1], to = xlim[2], length.out = 100)
h <- hGPD(x, shape = shape)
plot(x, h, type = "o", main = "hazard rate shape > 0 ")



