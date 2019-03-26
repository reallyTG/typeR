library(episode)


### Name: ratmak
### Title: Create 'ratmak' (Rational Mass Action Kinetics) object
### Aliases: ratmak

### ** Examples

# Rational mass action kinetics
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
x0 <- c(X = 1, Y = 4, Z = 0.1, W = 0.1)
time <- seq(0, 1, by = .1)

rmak <- ratmak(A, diag(4))

# Solve system
numsolve(o = rmak, time = time, x0 = x0,
  param = list(theta1 = t(A * 1:3),
      theta2 = t((A + 1) * 3:1)))

# Evaluate field
field(rmak, x0,
  param = list(theta1 = t(A * 1:3),
      theta2 = t((A + 1) * 3:1)))




