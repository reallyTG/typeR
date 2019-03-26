library(libstableR)


### Name: libstableR
### Title: LibstableR: Fast and accurate evaluation, random number
###   generation and parameter estimation of skew stable distributions.
### Aliases: libstableR libstableR-package
### Keywords: package

### ** Examples

# Set alpha, beta, sigma and mu stable parameters in a vector
pars <- c(1.5, 0.9, 1, 0)

# Generate an abscissas axis and probabilities vector
x <- seq(-5, 10, 0.05)
p <- seq(0.01, 0.99, 0.01)

# Calculate pdf, cdf and quantiles
pdf <- stable_pdf(x, pars)
cdf <- stable_cdf(x, pars)
xq  <- stable_q(p, pars)

# Generate 300 random values
rnd <- stable_rnd(300, pars)

# Estimate the parameters of the skew stable distribution given
# the generated sample:

# Using the McCulloch's estimator:
pars_est_M <- stable_fit_init(rnd)

# Using the Koutrouvelis' estimator:
pars_est_K <- stable_fit_koutrouvelis(rnd, pars_est_M)

# Using maximum likelihood estimator, with McCulloch estimation
# as a starting point:
# pars_est_ML <- stable_fit_mle(rnd, pars_est_M)

# Using modified maximum likelihood estimator (See [1]):
# pars_est_ML2 <- stable_fit_mle2d(rnd, pars_est_M)



