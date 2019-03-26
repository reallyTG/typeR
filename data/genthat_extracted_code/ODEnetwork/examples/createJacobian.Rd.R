library(ODEnetwork)


### Name: createJacobian
### Title: Create Jacobian matrix for the parameters of the ODE.
### Aliases: createJacobian

### ** Examples

masses <- 4:6
dampers <- diag(1:3)
springs <- diag(7:9)
odenet <- ODEnetwork(masses, dampers, springs)
position <- rep(10, 3)
velocity <- rep(0, 3)
odenet <- setState(odenet, position, velocity)
jac <- createJacobian(odenet)



