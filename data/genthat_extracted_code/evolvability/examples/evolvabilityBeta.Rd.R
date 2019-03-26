library(evolvability)


### Name: evolvabilityBeta
### Title: Calculate evolvability parameters along a set of selection
###   gradients
### Aliases: evolvabilityBeta
### Keywords: array algebra

### ** Examples

G = matrix(c(1, 1, 0, 1, 2, 1, 0, 1, 2), ncol = 3)/10
Beta = randomBeta(5, 3)
X = evolvabilityBeta(G, Beta)
summary(X)



