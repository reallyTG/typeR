library(secr)


### Name: clone
### Title: Replicate Rows
### Aliases: clone clone.default clone.popn clone.capthist
### Keywords: manip

### ** Examples

## population of animals at 1 / hectare generates random
## Poisson number of cues, lambda = 5
mics4 <- make.grid( nx = 2, ny = 2, spacing = 44, detector = "signal")
pop <- sim.popn (D = 1, core = mics4, buffer = 300, nsessions = 66)
pop <- clone (pop, "poisson", 5)
attr(pop[[1]],"freq")

clone(captdata, "poisson", 3)



