library(ODEnetwork)


### Name: plot.ODEnetwork
### Title: Plots Results of ODEnetwork
### Aliases: plot.ODEnetwork

### ** Examples

masses <- c(1, 2)
dampers <- diag(c(0.1, 0.5))
dampers[1, 2] <- 0.05
springs <- diag(c(4, 10))
springs[1, 2] <- 6
odenet <- ODEnetwork(masses, dampers, springs)
odenet <- setState(odenet, c(1, 3), c(0, 0))
odenet <- simuNetwork(odenet, seq(0, 10, by = 0.05))
plot(odenet)
plot(odenet, var = 2L)
plot(odenet, state = "1")
plot(odenet, state = "2")
plot(odenet, state = "1vs2")



