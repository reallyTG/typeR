library(ODEnetwork)


### Name: getResult
### Title: Get Result
### Aliases: getResult

### ** Examples

masses <- 1
dampers <- as.matrix(0.1)
springs <- as.matrix(4)
odenet <- ODEnetwork(masses, dampers, springs)
getResult(odenet)



