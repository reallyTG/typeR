library(ODEnetwork)


### Name: ODEnetwork
### Title: Constructor of the class ODEnetwork
### Aliases: ODEnetwork

### ** Examples

mM <- c(40, 10, 10)
mD <- diag(c(1, 5, 0))
mD[1, 2] <- 1
mD[2, 3] <- 1
mK <- diag(c(50, 50, 0))
mK[1, 2] <- 10
mK[2, 3] <- 10
odenet <- ODEnetwork(mM, mD, mK)



