library(elhmc)


### Name: ELHMC
### Title: Empirical Likelihood Hamiltonian Monte Carlo Sampling
### Aliases: ELHMC

### ** Examples

## Not run: 
##D ## Suppose there are four data points (1, 1), (1, -1), (-1, -1), (-1, 1)
##D x = rbind(c(1, 1), c(1, -1), c(-1, -1), c(-1, 1))
##D ## If the parameter of interest is the mean, the smoothing function and
##D ## its gradient would be
##D f <- function(params, x) {
##D  x - params
##D }
##D df <- function(params, x) {
##D  rbind(c(-1, 0), c(0, -1))
##D }
##D ## Draw 50 samples from the Empirical Likelihood Bayesian posterior distribution
##D ## of the mean, using initial values (0.96, 0.97) and standard normal distributions
##D ## as priors:
##D normal_prior <- function(x) {
##D    exp(-0.5 * x[1] ^ 2) / sqrt(2 * pi) * exp(-0.5 * x[2] ^ 2) / sqrt(2 * pi)
##D }
##D normal_prior_log_gradient <- function(x) {
##D    -x
##D }
##D set.seed(1234)
##D mean.samples <- ELHMC(initial = c(0.96, 0.97), data = x, fun = f, dfun = df,
##D                      n.samples = 50, prior = normal_prior,
##D                      dprior = normal_prior_log_gradient)
##D plot(mean.samples$samples, type = "l", xlab = "", ylab = "")
## End(Not run)



