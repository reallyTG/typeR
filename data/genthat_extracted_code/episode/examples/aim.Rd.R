library(episode)


### Name: aim
### Title: Adaptive Integral Matching (AIM)
### Aliases: aim

### ** Examples

set.seed(123)
# Michaelis-Menten system with two 0-rate reactions
A <- matrix(c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0,
  0, 0, 1, 1,
  0, 0, 1, 1), ncol = 4, byrow = TRUE)
B <- matrix(c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1,
  0, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
k <- c(0.1, 1.25, 0.5, 0, 0); x0 <- c(E = 5, S = 5, ES = 1.5, P = 1.5)
Time <- seq(0, 10, by = 1)

# Simulate data, in second context the catalytic rate has been inhibited
contexts <- cbind(1, c(1, 1, 0, 1, 1))
m <- mak(A, B, r = reg(contexts = contexts))
y <- numsolve(m, c(Time, Time), cbind(x0, x0 + c(2, -2, 0, 0)), contexts * k)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .25), nrow = nrow(y))

# Create optimisation object via data
o <- opt(y, nlambda = 10)

# Fit data using Adaptive Integral Matching on mak-object
a <- aim(m, o)
a$params$rate

# Compare with true parameter on column vector form
matrix(k, ncol = 1)


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

# Estimation
a <- aim(p, opt(y, nlambda = 10))
a$params$theta

# Compare with true parameter on column vector form
matrix(theta, ncol = 1)


# Example: use custom lowess smoother on data
# Smooth each coordinate of data to get curve
# on extended time grid
ext_time <- seq(0, 1, by = 0.001)
x_smooth <- apply(y[, -1], 2, function(z) {
  # Create loess object
  data <- data.frame(Time = y[, -1], obs = z)
  lo <- loess(obs ~ Time, data)

  # Get smoothed curve on extended time vector
  predict(lo, newdata = data.frame(Time = ext_time))
})

# Bind the extended time
x_smooth <- cbind(ext_time, x_smooth)

# Run aim on the custom smoothed curve
a_custom <- aim(p, opt(y), x = x_smooth)





