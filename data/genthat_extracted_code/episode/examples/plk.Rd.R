library(episode)


### Name: plk
### Title: Create 'plk' (Power Law Kinetics) object
### Aliases: plk

### ** Examples

# Power law system
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  0, 0, 0, 1), ncol = 4, byrow = TRUE)
theta <- matrix(
c(0, 2, -0.5, 0,
  1, 0, 0, 1,
  -1, -1, -1, -1), ncol = 3, byrow = TRUE)
x0 <- c(X = 1, Y = 4, Z = 0.1, W = 0.1)
Time <- seq(0, 1, by = .1)

p <- plk(A)

# Solve system
numsolve(p, Time, x0, theta)

# Evaluate field
field(p, x0, theta)




