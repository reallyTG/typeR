library(intrinsicDimension)


### Name: Spherical
### Title: Isotropic Distributions With or Without Noise
### Aliases: hyperBall hyperSphere isotropicNormal
### Keywords: datagen

### ** Examples

datap <- hyperSphere(100, 1, 3, sd = .1)
par(mfrow = c(1, 2))
plot(datap[, 1], datap[, 2])
plot(datap[, 1], datap[, 3])    




