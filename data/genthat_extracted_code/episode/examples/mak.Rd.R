library(episode)


### Name: mak
### Title: Create 'mak' (Mass Action Kinetics) object
### Aliases: mak

### ** Examples

# Michaelis-Menten system
A <- matrix(
c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0), ncol = 4, byrow = TRUE)
B <- matrix(
c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
k <- c(1, 2, 0.5)
x0 <- c(E = 1, S = 4, ES = 0, P = 0)
Time <- seq(0, 1, by = .1)

m <- mak(A, B)

# Solve system
numsolve(m, Time, x0, k)

# Evaluate field
field(m, x0, k)




