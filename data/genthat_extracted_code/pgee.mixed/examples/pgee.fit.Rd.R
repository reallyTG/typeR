library(pgee.mixed)


### Name: pgee.fit
### Title: Penalized Generalized Estimating Equations
### Aliases: pgee.fit

### ** Examples

set.seed(100)
# Gaussian
N <- 100
m <- 10
p <- 10
y <- rnorm(N * m)
# If you want standardize = TRUE, you must provide an intercept.
X <- cbind(1, matrix(rnorm(N * m * (p - 1)), N * m, p - 1))
fit <- pgee.fit(X = X, y = y, N = N, m = m, lambda = 0.5, wctype = "CS",
            family = "Gaussian")
str(fit)
fit$coefficients
fit$vcov

# Binary
y <- sample(0:1, N*m, replace = TRUE)
fit <- pgee.fit(X = X, y = y, N = N, m = m, lambda = 0.1, wctype = "CS",
            family = "Binomial")
str(fit)
fit$coefficients
fit$vcov

# Bivariate mixed outcomes
# Generate some data
Bc <- c(2.0, 3.0, 1.5, 2.0, rep(0, times = p - 4))
Bb <- c(0.7, -0.7, -0.4, rep(0, times = p - 3))
dat <- gen_mixed_data(Bc, Bc, N, 0.5)
# Estimate regression coefficients and false discovery rate
fit <- pgee.fit(X = dat$X, yc = dat$yc, yb = dat$yb, N = N, m = 2,
            wctype = "CS", family = "Mixed", lambda = c(0.1, 0.05),
            FDR = TRUE)
str(fit)
fit$coefficients
fit$vcov



