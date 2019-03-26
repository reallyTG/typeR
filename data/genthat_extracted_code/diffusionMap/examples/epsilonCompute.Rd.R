library(diffusionMap)


### Name: epsilonCompute
### Title: Compute default diffusion map epsilon.
### Aliases: epsilonCompute
### Keywords: multivariate nonparametric

### ** Examples

data(annulus)
D = dist(annulus) # use Euclidean distance
epsilonCompute(D,.005)
epsilonCompute(D,.01)
epsilonCompute(D,.05)
epsilonCompute(D,.1)




