library(episode)


### Name: numsolve
### Title: Numerical solver for Ordinary Differential Equation (ODE)
###   systems.
### Aliases: numsolve

### ** Examples

# Example: Michaelis-Menten system
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
Time <- seq(0, .5, by = .1)

m <- mak(A, B)

# Solution for one context
numsolve(m, Time, x0, k)

# Solution for two contexts (the latter with faster rate)
numsolve(m, c(Time, Time), x0, cbind(k, k * 1.5))

# Solution for two contexts (the latter with different initial condition)
numsolve(m, c(Time, Time), cbind(x0, x0 + 1.5), k)

# As above, but with sensitivity equations are solved (using approximate solution)
numsolve(m, c(Time, Time), cbind(x0, x0 + 1.5), k, TRUE)


# Example: Power law kinetics
A <- matrix(c(1, 0, 1,
              1, 1, 0), byrow = TRUE, nrow = 2)
p <- plk(A)
x0 <- c(10, 4, 1)
theta <- matrix(c(0, -0.25,
                  0.75, 0,
                  0, -0.1), byrow = TRUE, nrow = 3)
numsolve(p, Time, x0, theta)




