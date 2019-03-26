library(bridgesampling)


### Name: bridge_sampler
### Title: Log Marginal Likelihood via Bridge Sampling
### Aliases: bridge_sampler bridge_sampler.stanfit bridge_sampler.mcmc.list
###   bridge_sampler.mcmc bridge_sampler.matrix bridge_sampler.stanreg
###   bridge_sampler.rjags bridge_sampler.runjags
###   bridge_sampler.MCMC_refClass

### ** Examples

## ------------------------------------------------------------------------
## Example 1: Estimating the Normalizing Constant of a Two-Dimensional
##            Standard Normal Distribution
## ------------------------------------------------------------------------

library(bridgesampling)
library(mvtnorm)

samples <- rmvnorm(1e4, mean = rep(0, 2), sigma = diag(2))
colnames(samples) <- c("x1", "x2")
log_density <- function(samples.row, data) {
  -.5*t(samples.row) %*% samples.row
}

lb <- rep(-Inf, 2)
ub <- rep(Inf, 2)
names(lb) <- names(ub) <- colnames(samples)
bridge_result <- bridge_sampler(samples = samples, log_posterior = log_density,
                                data = NULL, lb = lb, ub = ub, silent = TRUE)

# compare to analytical value
analytical <- log(2*pi)
print(cbind(bridge_result$logml, analytical))

## Not run: 
##D 
##D ## ------------------------------------------------------------------------
##D ## Example 2: Hierarchical Normal Model
##D ## ------------------------------------------------------------------------
##D 
##D # for a full description of the example, see
##D vignette("bridgesampling_example_jags")
##D 
##D library(R2jags)
##D 
##D ### generate data ###
##D 
##D set.seed(12345)
##D 
##D mu <- 0
##D tau2 <- 0.5
##D sigma2 <- 1
##D 
##D n <- 20
##D theta <- rnorm(n, mu, sqrt(tau2))
##D y <- rnorm(n, theta, sqrt(sigma2))
##D 
##D 
##D ### set prior parameters
##D alpha <- 1
##D beta <- 1
##D mu0 <- 0
##D tau20 <- 1
##D 
##D ### functions to get posterior samples ###
##D 
##D ### H0: mu = 0
##D 
##D getSamplesModelH0 <- function(data, niter = 52000, nburnin = 2000, nchains = 3) {
##D 
##D   model <- "
##D     model {
##D       for (i in 1:n) {
##D         theta[i] ~ dnorm(0, invTau2)
##D           y[i] ~ dnorm(theta[i], 1/sigma2)
##D       }
##D       invTau2 ~ dgamma(alpha, beta)
##D       tau2 <- 1/invTau2
##D     }"
##D 
##D   s <- jags(data, parameters.to.save = c("theta", "invTau2"),
##D             model.file = textConnection(model),
##D             n.chains = nchains, n.iter = niter,
##D             n.burnin = nburnin, n.thin = 1)
##D 
##D   return(s)
##D 
##D }
##D 
##D ### H1: mu != 0
##D 
##D getSamplesModelH1 <- function(data, niter = 52000, nburnin = 2000,
##D                               nchains = 3) {
##D 
##D   model <- "
##D     model {
##D       for (i in 1:n) {
##D         theta[i] ~ dnorm(mu, invTau2)
##D         y[i] ~ dnorm(theta[i], 1/sigma2)
##D       }
##D       mu ~ dnorm(mu0, 1/tau20)
##D       invTau2 ~ dgamma(alpha, beta)
##D       tau2 <- 1/invTau2
##D     }"
##D 
##D   s <- jags(data, parameters.to.save = c("theta", "mu", "invTau2"),
##D             model.file = textConnection(model),
##D             n.chains = nchains, n.iter = niter,
##D             n.burnin = nburnin, n.thin = 1)
##D 
##D   return(s)
##D 
##D }
##D 
##D ### get posterior samples ###
##D 
##D # create data lists for Jags
##D data_H0 <- list(y = y, n = length(y), alpha = alpha, beta = beta, sigma2 = sigma2)
##D data_H1 <- list(y = y, n = length(y), mu0 = mu0, tau20 = tau20, alpha = alpha,
##D                 beta = beta, sigma2 = sigma2)
##D 
##D # fit models
##D samples_H0 <- getSamplesModelH0(data_H0)
##D samples_H1 <- getSamplesModelH1(data_H1)
##D 
##D 
##D ### functions for evaluating the unnormalized posteriors on log scale ###
##D log_posterior_H0 <- function(samples.row, data) {
##D 
##D   mu <- 0
##D   invTau2 <- samples.row[[ "invTau2" ]]
##D   theta <- samples.row[ paste0("theta[", seq_along(data$y), "]") ]
##D 
##D   sum(dnorm(data$y, theta, data$sigma2, log = TRUE)) +
##D     sum(dnorm(theta, mu, 1/sqrt(invTau2), log = TRUE)) +
##D     dgamma(invTau2, data$alpha, data$beta, log = TRUE)
##D 
##D }
##D 
##D log_posterior_H1 <- function(samples.row, data) {
##D 
##D   mu <- samples.row[[ "mu" ]]
##D   invTau2 <- samples.row[[ "invTau2" ]]
##D   theta <- samples.row[ paste0("theta[", seq_along(data$y), "]") ]
##D 
##D   sum(dnorm(data$y, theta, data$sigma2, log = TRUE)) +
##D     sum(dnorm(theta, mu, 1/sqrt(invTau2), log = TRUE)) +
##D     dnorm(mu, data$mu0, sqrt(data$tau20), log = TRUE) +
##D     dgamma(invTau2, data$alpha, data$beta, log = TRUE)
##D 
##D }
##D 
##D # specify parameter bounds H0
##D cn <- colnames(samples_H0$BUGSoutput$sims.matrix)
##D cn <- cn[cn != "deviance"]
##D lb_H0 <- rep(-Inf, length(cn))
##D ub_H0 <- rep(Inf, length(cn))
##D names(lb_H0) <- names(ub_H0) <- cn
##D lb_H0[[ "invTau2" ]] <- 0
##D 
##D # specify parameter bounds H1
##D cn <- colnames(samples_H1$BUGSoutput$sims.matrix)
##D cn <- cn[cn != "deviance"]
##D lb_H1 <- rep(-Inf, length(cn))
##D ub_H1 <- rep(Inf, length(cn))
##D names(lb_H1) <- names(ub_H1) <- cn
##D lb_H1[[ "invTau2" ]] <- 0
##D 
##D 
##D # compute log marginal likelihood via bridge sampling for H0
##D H0.bridge <- bridge_sampler(samples = samples_H0, data = data_H0,
##D                             log_posterior = log_posterior_H0, lb = lb_H0,
##D                             ub = ub_H0, silent = TRUE)
##D print(H0.bridge)
##D 
##D # compute log marginal likelihood via bridge sampling for H1
##D H1.bridge <- bridge_sampler(samples = samples_H1, data = data_H1,
##D                             log_posterior = log_posterior_H1, lb = lb_H1,
##D                             ub = ub_H1, silent = TRUE)
##D print(H1.bridge)
##D 
##D # compute percentage error
##D print(error_measures(H0.bridge)$percentage)
##D print(error_measures(H1.bridge)$percentage)
##D 
##D # compute Bayes factor
##D BF01 <- bf(H0.bridge, H1.bridge)
##D print(BF01)
##D 
##D # compute posterior model probabilities (assuming equal prior model probabilities)
##D post1 <- post_prob(H0.bridge, H1.bridge)
##D print(post1)
##D 
##D # compute posterior model probabilities (using user-specified prior model probabilities)
##D post2 <- post_prob(H0.bridge, H1.bridge, prior_prob = c(.6, .4))
##D print(post2)
##D 
## End(Not run)

## Not run: 
##D 
##D ## ------------------------------------------------------------------------
##D ## Example 3: rstanarm
##D ## ------------------------------------------------------------------------
##D library(rstanarm)
##D 
##D # N.B.: remember to specify the diagnostic_file
##D 
##D fit_1 <- stan_glm(mpg ~ wt + qsec + am, data = mtcars,
##D                   chains = 2, cores = 2, iter = 5000,
##D                   diagnostic_file = file.path(tempdir(), "df.csv"))
##D bridge_1 <- bridge_sampler(fit_1)
##D fit_2 <- update(fit_1, formula = . ~ . + cyl)
##D bridge_2 <- bridge_sampler(fit_2, method = "warp3")
##D bf(bridge_1, bridge_2)
##D 
## End(Not run)




