library(bulletcp)


### Name: runmcmc_cp0
### Title: Estimate a posterior distribution of data conditional on zero
###   changepoints.
### Aliases: runmcmc_cp0

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
# define starting values
start.vals <- list("sigma" = c(1), "l" = c(10))

# proposal variance for the MH step
prop_var <- diag(c(1/2,1/2))

set.seed(1111)
m0cp <- runmcmc_cp0(data = fake_groove, iter = 500,
    start.vals = start.vals,
    prop_var = prop_var, warmup = 100, verbose = FALSE)



