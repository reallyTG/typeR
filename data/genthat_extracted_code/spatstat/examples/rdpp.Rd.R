library(spatstat)


### Name: rdpp
### Title: Simulation of a Determinantal Point Process
### Aliases: rdpp
### Keywords: datagen spatial models

### ** Examples

index <- expand.grid(-2:2,-2:2)
eig <- exp(-rowSums(index^2))
X <- rdpp(eig, index)
X
## To simulate a det. projection p. p. with the given indices set eig=1:
XX <- rdpp(1, index)
XX



