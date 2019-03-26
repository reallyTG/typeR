library(episode)


### Name: numint
### Title: Numerical integration of powers and fractions of powers via
###   simpson rule
### Aliases: numint

### ** Examples

# Trajectory of power law kinetics system
A <- matrix(c(1, 0, 1,
              1, 1, 0), byrow = TRUE, nrow = 2)
p <- plk(A)
x0 <- c(10, 4, 1)
theta <- matrix(c(0, -0.25,
                  0.75, 0,
                  0, -0.1), byrow = TRUE, nrow = 3)
Time <- seq(0, 1, by = .025)
traj <- numsolve(p, Time, x0, theta)

# Example: Integrate traj(s)^A between the time points in 'ti'
ti <- seq(0, 1, by = .1)
ss <- numint(time = ti, x = traj, type = "power", A = A, B = A)

# Example: Integrate traj(s)^A / (1 + traj(s)^B) between the time points in 'ti'
B <- matrix(c(0, 2, 1,
              2, 1, 0), byrow = TRUE, nrow = 2)
ss <- numint(time = ti, x = traj, type = "fracpower", A = A, B = B)




