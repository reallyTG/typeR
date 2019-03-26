library(libstableR)


### Name: stable_fit
### Title: Methods for parameter estimation of skew stable distributions.
### Aliases: stable_fit stable_fit_init stable_fit_koutrouvelis
###   stable_fit_mle stable_fit_mle2d
### Keywords: distribution

### ** Examples

# Set alpha, beta, sigma and mu stable parameters in a vector
pars <- c(1.5, 0.9, 1, 0)

# Generate 300 random values
rnd <- stable_rnd(300, pars)

# Estimate the parameters of the skew stable distribution given
# the generated sample:

# Using the McCulloch's estimator:
pars_init <- stable_fit_init(rnd)

# Using the Koutrouvelis' estimator, with McCulloch estimation
# as a starting point:
pars_est_K <- stable_fit_koutrouvelis(rnd, pars_init)

# Using maximum likelihood estimator:
# pars_est_ML <- stable_fit_mle(rnd, pars_est_K)

# Using modified maximum likelihood estimator (see [1]):
# pars_est_ML2 <- stable_fit_mle2d(rnd, pars_est_K)



