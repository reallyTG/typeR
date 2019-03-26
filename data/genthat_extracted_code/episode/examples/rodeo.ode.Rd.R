library(episode)


### Name: rodeo.ode
### Title: Regularised Ordinary Differential Equation Optimisation (RODEO)
### Aliases: rodeo.ode

### ** Examples

set.seed(123)
# Example: Michaelis-Menten system with two 0-rate reactions
A <- matrix(c(1, 1, 0, 0,
              0, 0, 1, 0,
              0, 0, 1, 0,
              0, 1, 0, 0,
              0, 0, 0, 1), ncol = 4, byrow = TRUE)
B <- matrix(c(0, 0, 1, 0,
              1, 1, 0, 0,
              1, 0, 0, 1,
              0, 0, 0, 1,
              0, 0, 1, 0), ncol = 4, byrow = TRUE)
k <- c(1, 2, 0.5, 0, 0); x0 <- c(E = 2, S = 8, ES = 0.5, P = 0.5)
Time <- seq(0, 10, by = 1)

# Simulate data, in second context the catalytic rate has been doubled
m <- mak(A, B)
contexts <- cbind(1, c(1, 1, 2, 1, 1))
y <- numsolve(m, c(Time, Time), cbind(x0, x0 + c(2, -2, 0, 0)), contexts * k)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .1), nrow = nrow(y))

# Fit data using rodeo on mak-object
op <- opt(y)
fit <- rodeo(m, op, x0 = NULL, params = NULL)

# Example: fit data knowing doubled catalytic rate
m_w_doubled <- mak(A, B, r = reg(contexts = contexts))
fit <- rodeo(m_w_doubled, op, x0 = NULL, params = NULL)




