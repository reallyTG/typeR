library(ODEnetwork)


### Name: updateOscillators
### Title: Update oscillator parameter of an existing ODE network.
### Aliases: updateOscillators

### ** Examples

masses <- c(1:5)
dampers <- diag(11:15)
springs <- diag(21:25)
odenet <- ODEnetwork(masses, dampers, springs)
odenet <- updateOscillators(odenet, masses = c(3:7))
odenet <- updateOscillators(odenet, c(k.1.2 = 201, k.3.5 = 202, r.1 = 2))
# Warning: Following value is ignored, because it is on the lower triangle
odenet <- updateOscillators(odenet, c(d.2.1 = 101))



