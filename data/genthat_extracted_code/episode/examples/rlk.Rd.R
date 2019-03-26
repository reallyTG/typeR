library(episode)


### Name: rlk
### Title: Create 'rlk' (Rational Law Kinetics) object
### Aliases: rlk

### ** Examples

# Rational law kinetics
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  0, 0, 0, 1), ncol = 4, byrow = TRUE)
theta <- matrix(
c(0, 2, -0.5, 0,
  1, 0, 0, 1,
  -1, -1, -1, -1), ncol = 3, byrow = TRUE)
x0 <- c(X = 1, Y = 4, Z = 0.1, W = 0.1)
time <- seq(0, 1, by = .1)
r <- rlk(A, A[c(2, 1, 3), ])

# Solve system
numsolve(o = r, time = time, x0 = x0, param = theta)

# Evaluate field
field(r, x0, theta)




