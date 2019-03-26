library(rhmc)


### Name: hamiltonian_dynamics
### Title: Hamiltonian Dynamics
### Aliases: hamiltonian_dynamics

### ** Examples

U = function(x) exp(-0.5 * x^2) / sqrt(2 * pi)
hamiltonian_dynamics(U, -2, 0.8, 100, 0.1, 1)
hamiltonian_dynamics(U, -2, 0.85, 100, 0.1, 1)




