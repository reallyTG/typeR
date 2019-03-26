library(ODEnetwork)


### Name: calcResonances
### Title: Calculate Resonance Frequencies
### Aliases: calcResonances

### ** Examples

masses <- 1
dampers <- as.matrix(0.1)
springs <- as.matrix(4)
odenet <- ODEnetwork(masses, dampers, springs)
calcResonances(odenet)



