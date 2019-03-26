library(bulletcp)


### Name: runmcmc_cp2
### Title: Estimate a posterior distribution of data conditional that there
###   are two grooves.
### Aliases: runmcmc_cp2

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

# define starting values
start.vals <- list("sigma" = c(1,1,1),
                "l" = c(10,10,10),
                "cp" = c(cp_start_left, cp_start_right),
                "beta" = c(-2,2),
                "intercept" = c(0,0))

# define proposal variances (not for changepoints)
prop_var <- list(diag(c(1/2,1/2,1/2,1/2)),
              diag(c(1/2,1/2)),
              diag(c(1/2,1/2,1/2,1/2)))

# define proposal variance for changepoints
cp_prop_var <- diag(c(10^2, 10^2))


# run Gibbs MCMC for both the right only and left only GEA models
set.seed(1111)
m2cp <- runmcmc_cp2(data = fake_groove,
                 iter = 500,
                 start.vals = start.vals,
                 prop_var = prop_var,
                 cp_prop_var = cp_prop_var,
                 tol_edge = 50, tol_cp = 1000,
                 warmup = 100,
                 verbose = FALSE)



