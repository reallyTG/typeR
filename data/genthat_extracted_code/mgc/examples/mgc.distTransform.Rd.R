library(mgc)


### Name: mgc.distTransform
### Title: MGC Distance Transform
### Aliases: mgc.distTransform

### ** Examples

library(mgc)

n=200; d=2
data <- mgc.sims.linear(n, d)
Dx <- as.matrix(dist(data$X), nrow=n); Dy <- as.matrix(dist(data$Y), nrow=n)
dt <- mgc.distTransform(Dx, Dy)




