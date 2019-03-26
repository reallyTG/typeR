library(episode)


### Name: rodeo.aim
### Title: Regularised Ordinary Differential Equation Optimisation (RODEO)
###   initialised via Adaptive Integral Matching
### Aliases: rodeo.aim

### ** Examples

set.seed(123)
# Example: Power Law Kinetics
A <- matrix(c(1, 0, 1,
  1, 1, 0), byrow = TRUE, nrow = 2)
p <- plk(A)
x0 <- c(10, 4, 1)
theta <- matrix(c(0, -0.25,
  0.75, 0,
  0, -0.1), byrow = TRUE, nrow = 3)
Time <- seq(0, 1, by = .025)

# Simulate data
y <- numsolve(p, Time, x0, theta)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .25), nrow = nrow(y))

# Estimation via aim
a <- aim(p, opt(y, nlambda = 10))
a$params$theta

# Supply to rodeo
rod <- rodeo(a)
rod$params$theta

# Compare with true parameter on column vector form
matrix(theta, ncol = 1)


# Example: include data from an intervened system
# where the first complex in A is inhibited
contexts <- cbind(1, c(0, 0, 0, 1, 1, 1))
y2 <- numsolve(p, Time, x0 + 1, theta * contexts[, 2])
y2[, -1] <- y2[, -1] + matrix(rnorm(prod(dim(y2[, -1])), sd = .25), nrow = nrow(y2))

# Estimation via aim
a <- aim(plk(A, r = reg(contexts = contexts)), opt(rbind(y, y2), nlambda = 10))
a$params$theta

# Supply to rodeo
rod <- rodeo(a)
rod$params$theta





