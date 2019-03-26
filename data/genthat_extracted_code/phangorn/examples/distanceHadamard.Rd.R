library(phangorn)


### Name: distanceHadamard
### Title: Distance Hadamard
### Aliases: distanceHadamard
### Keywords: cluster

### ** Examples


data(yeast)
dm <- dist.hamming(yeast)
dm <- as.matrix(dm)
fit <- distanceHadamard(dm)
lento(fit)
plot(as.networx(fit), "2D")




