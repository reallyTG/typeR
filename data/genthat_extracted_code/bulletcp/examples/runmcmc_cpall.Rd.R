library(bulletcp)


### Name: runmcmc_cpall
### Title: Estimate posterior distributions for the 0, 1, or 2 changepoint
###   case.
### Aliases: runmcmc_cpall

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
cp0.start.vals <- list("sigma" = c(1), "l" = c(10))
cp1.start.vals <- list("left" = list("sigma" = c(1,1),
                              "l" = c(10,10),
                              "cp" = c(cp_start_left),
                              "beta" = c(-1),
                              "intercept" = c(0)),
                              "right" = list("sigma" = c(1,1),
                               "l" = c(10,10),
                                "cp" = c(cp_start_right),
                                "beta" = c(1),
                                "intercept" = c(0)))
cp2.start.vals <- list("sigma" = c(1,1,1),
                "l" = c(10,10,10),
                "cp" = c(cp_start_left, cp_start_right),
                "beta" = c(-2,2),
                "intercept" = c(0,0))
start.vals <- list("cp2" = cp2.start.vals, "cp1" = cp1.start.vals, "cp0" = cp0.start.vals)

# list of starting values for each of the two MH steps
# (not sampling the changepoint) for both the left and right changepoint models
prop_var_0cp <- diag(c(1/2,1/2))
prop_var_lrcp <- list("left" = list(diag(c(1/2,1/2,1/2,1/2)),
                            diag(c(1/2,1/2))),
                            "right" = list(diag(c(1/2,1/2)),
                            diag(c(1/2,1/2,1/2, 1/2))))

prop_var_2cp <- list(diag(c(1/2,1/2,1/2,1/2)),
              diag(c(1/2,1/2)),
              diag(c(1/2,1/2,1/2,1/2)))

prop_var <- list("cp2" = prop_var_2cp, "cp1" = prop_var_lrcp, "cp0" = prop_var_0cp)

# define the proposal variance for the RWMH step sampling the changepoint
cp_prop_var <- list("cp2" = diag(c(10^2, 10^2)),
                 "cp1" = 10^2)

# prior on the number of changepoints
prior_numcp <- rep(1/4, times = 4)

set.seed(1111)
cp_gibbs <- runmcmc_cpall(data = fake_groove,
                       start.vals = start.vals,
                       prop_var = prop_var,
                       cp_prop_var = cp_prop_var,
                       verbose = FALSE,
                       tol_edge = 50,
                       tol_cp = 1000,
                       iter = 300,
                       warmup = 100,
                       prior_numcp = prior_numcp)



