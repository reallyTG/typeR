library(bssm)


### Name: run_mcmc.ngssm
### Title: Bayesian inference of non-Gaussian or non-linear state space
###   models using MCMC
### Aliases: run_mcmc.ngssm run_mcmc.ng_bsm run_mcmc.ng_ar1 run_mcmc.svm
###   run_mcmc.nlg_ssm run_mcmc.sde_ssm

### ** Examples

set.seed(1)
n <- 50 
slope <- cumsum(c(0, rnorm(n - 1, sd = 0.001)))
level <- cumsum(slope + c(0, rnorm(n - 1, sd = 0.2)))
y <- rpois(n, exp(level))
poisson_model <- ng_bsm(y, 
  sd_level = halfnormal(0.01, 1), 
  sd_slope = halfnormal(0.01, 0.1), 
  P1 = diag(c(10, 0.1)), distribution = "poisson")
mcmc_is <- run_mcmc(poisson_model, n_iter = 1000, nsim_states = 10, method = "is2")
summary(mcmc_is, only_theta = TRUE, return_se = TRUE)



