library(episode)


### Name: solver
### Title: Create 'solver' object
### Aliases: solver

### ** Examples

# Use 'solver' object to specify numerical solver when creating 'ode' objects

# Example: power law kinetics with Dormand-Prince order 4/5 solver
A <- matrix(
c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0), ncol = 4, byrow = TRUE)
p <- plk(A, s = solver("dp45"))

# Example: ... and with more steps
p <- plk(A, s = solver("dp45", step_max = 1e3))

# Example: rational mass action kinetics with Runge-Kutta order 2/3 solver
B <- matrix(
c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
rmak <- ratmak(A, B, s = solver("rk23"))




