library(mateable)


### Name: synchrony
### Title: Make potentials object-mating synchrony
### Aliases: synchrony

### ** Examples

pop <- simulateScene(size = 150)
synchrony(pop, "augs")

pop2 <- simulateScene(size = 1234, sdDur = 5, sk = 1)
syncVals <- synchrony(pop2, "sync_nn", "all", "median", 123)



