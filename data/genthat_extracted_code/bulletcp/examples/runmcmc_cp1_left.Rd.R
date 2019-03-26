library(bulletcp)


### Name: runmcmc_cp1_left
### Title: Estimate a posterior distribution of data conditional on a left
###   groove and no right groove.
### Aliases: runmcmc_cp1_left

### ** Examples

# Fake data
sim_groove <- function(beta = c(-0.28,0.28), a = 125)
{
    x <- seq(from = 0, to = 2158, by = 20)
    med <- median(x)
    y <- 1*(x <= a)*(beta[1]*(x - med) - beta[1]*(a - med)) +
    1*(x >= 2158 - a)*(beta[2]*(x - med) - beta[2]*(2158 - a - med))
    return(data.frame("x" = x, "y" = y))
}

fake_groove <- sim_groove()

# define starting values for the changepoints
cp_start_left <- min(fake_groove$x) + 60
cp_start_right <- max(fake_groove$x) - 60

# define list of starting values for both the left and right changepoint models
start.vals <- list("left" = list("sigma" = c(1,1),
                              "l" = c(10,10),
                              "cp" = c(cp_start_left),
                              "beta" = c(-1),
                              "intercept" = c(0)),
                              "right" = list("sigma" = c(1,1),
                               "l" = c(10,10),
                                "cp" = c(cp_start_right),
                                "beta" = c(1),
                                "intercept" = c(0)))

# list of starting values for each of the two MH steps
# (not sampling the changepoint) for both the left and right changepoint models

prop_var <- list("left" = list(diag(c(1/2,1/2,1/2,1/2)),
                            diag(c(1/2,1/2))),
                            "right" = list(diag(c(1/2,1/2)),
                            diag(c(1/2,1/2,1/2, 1/2))))

# define the proposal variance for the RWMH step sampling the changepoint
cp_prop_var <- 10^2

# run Gibbs MCMC for the left GEA model
set.seed(1111)
m1cp_left <- runmcmc_cp1_left(data = fake_groove, iter = 500, warmup = 100,
                           start.vals = start.vals$left,
                           prop_var = prop_var$left,
                           cp_prop_var = cp_prop_var,
                           verbose = FALSE, tol_edge = 50)



