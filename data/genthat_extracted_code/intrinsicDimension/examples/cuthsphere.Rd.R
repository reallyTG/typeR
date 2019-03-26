library(intrinsicDimension)


### Name: cutHyperSphere
### Title: Piece of Noisy Hypersphere
### Aliases: cutHyperSphere
### Keywords: datagen

### ** Examples

datap <- cutHyperSphere(100, rat = .5, 1, 3, 0.01)
par(mfrow = c(1, 2))
plot(datap[, 1], datap[, 2])
plot(datap[, 1], datap[, 3])

datap <- cutHyperSphere(100, rat = 2, 1, 3, 0.11)
par(mfrow = c(1, 2))
plot(datap[, 1], datap[, 2])
plot(datap[, 1], datap[, 3])



