library(kergp)


### Name: parMap-methods
### Title: Map the Parameters of a Structure on the Inputs and Kernel
###   Parameters
### Aliases: parMap,covTS-method

### ** Examples

myCov <- covTS(d = 3, kernel = "k1Gauss",
               dep = c(range = "input"), value = c(range = 1.1))
parMap(myCov)



