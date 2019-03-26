library(ODEnetwork)


### Name: estimateDistances
### Title: Estimate distances between oscillators
### Aliases: estimateDistances

### ** Examples

masses <- c(1, 1)
dampers <- diag(c(1, 1))
springs <- diag(c(1, 1))
springs[1, 2] <- 1
equilibrium <- c(1/3, 5/3)
odenet <- ODEnetwork(masses, dampers, springs)
estimateDistances(odenet, equilibrium)$distances
estimateDistances(odenet, equilibrium, distGround="individual")$distances



