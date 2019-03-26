library(phangorn)


### Name: neighborNet
### Title: Computes a neighborNet from a distance matrix
### Aliases: neighborNet
### Keywords: hplot

### ** Examples


data(yeast)
dm <- dist.ml(yeast)
nnet <- neighborNet(dm)
plot(nnet, "2D")




