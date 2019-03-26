library(pgee.mixed)


### Name: cv.pgee
### Title: Cross validation for Penalized Generalized Estimating Equations
### Aliases: cv.pgee

### ** Examples

## Not run: 
##D # Gaussian
##D N <- 100
##D m <- 10
##D p <- 50
##D y <- rnorm(N * m)
##D # If you want standardize = TRUE, you must provide an intercept.
##D X <- cbind(1, matrix(rnorm(N * m * (p - 1)), N * m, p - 1))
##D gr1 <- seq(0.001, 0.1, length.out = 100)
##D fit <- cv.pgee(X = X, y = y, N = N, m = m, grid1 = gr1, wctype = "CS",
##D             family = "Gaussian")
##D 
##D # Binary
##D y <- sample(0:1, N*m, replace = TRUE)
##D fit <- cv.pgee(X = X, y = y, N = N, m = m, grid1 = gr1, wctype = "CS",
##D             family = "Binomial")
##D 
##D # Bivariate mixed outcomes
##D # Generate some data
##D Bc <- c(2.0, 3.0, 1.5, 2.0, rep(0,times=p-4))
##D Bb <- c(0.7, -0.7, -0.4, rep(0,times=p-3))
##D dat <- gen_mixed_data(Bc, Bc, N, 0.5)
##D # We require two grids of tuning parameters
##D gr2 <- seq(0.0001, 0.01, length.out = 100)
##D # Estimate regression coefficients and false discovery rate
##D fit <- cv.pgee(X = dat$X, Z = dat$Z, yc = dat$yc, yb = dat$yb, N = N, m = 2,
##D                wctype = "CS", family = "Mixed", grid1 = gr1, grid2 = gr2,
##D                FDR = TRUE)
## End(Not run)



