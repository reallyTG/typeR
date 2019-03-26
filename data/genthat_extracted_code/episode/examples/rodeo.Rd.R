library(episode)


### Name: rodeo
### Title: Regularised Ordinary Differential Equation Optimisation (RODEO)
###   generic
### Aliases: rodeo

### ** Examples

set.seed(123)
# Michaelis-Menten system with two 0-rate reactions
A <- matrix(c(1, 1, 0, 0,
 0, 0, 1, 0,
 0, 0, 1, 0,
 0, 0, 0, 1,
 1, 0, 0, 0), ncol = 4, byrow = TRUE)
B <- matrix(c(0, 0, 1, 0,
 1, 1, 0, 0,
 1, 0, 0, 1,
 0, 0, 1, 0,
 1, 0, 1, 0), ncol = 4, byrow = TRUE)
k <- c(1.1, 2.5, 0.25, 0, 0); x0 <- c(E = 2, S = 2, ES = 8.5, P = 2.5)
Time <- seq(0, 10, by = 1)

# Simulate data, in second context the catalytic rate has been doubled
contexts <- cbind(1, c(1, 1, 2, 1, 1))
m <- mak(A, B, r = reg(contexts = contexts))
y <- numsolve(m, c(Time, Time), cbind(x0, x0 + c(2, -2, 0, 0)), contexts * k)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .5), nrow = nrow(y))

# Example: fit data using rodeo on mak-object
op <- opt(y, nlambda = 10)
fit <- rodeo(m, op, x0 = NULL, params = NULL)
fit$params$rate

# Example: fit dat using rodeo on aim-object
a <- aim(m, op)
a$params$rate
fit <- rodeo(a)
fit$params$rate




