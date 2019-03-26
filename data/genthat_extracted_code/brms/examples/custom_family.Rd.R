library(brms)


### Name: custom_family
### Title: Custom Families in 'brms' Models
### Aliases: custom_family customfamily

### ** Examples

## Not run: 
##D ## demonstrate how to fit a beta-binomial model
##D ## generate some fake data
##D phi <- 0.7
##D n <- 300
##D z <- rnorm(n, sd = 0.2)
##D ntrials <- sample(1:10, n, replace = TRUE)
##D eta <- 1 + z
##D mu <- exp(eta) / (1 + exp(eta))
##D a <- mu * phi
##D b <- (1 - mu) * phi
##D p <- rbeta(n, a, b)
##D y <- rbinom(n, ntrials, p)
##D dat <- data.frame(y, z, ntrials)
##D 
##D # define a custom family
##D beta_binomial2 <- custom_family(
##D   "beta_binomial2", dpars = c("mu", "phi"),
##D   links = c("logit", "log"), lb = c(NA, 0),
##D   type = "int", vars = "trials[n]"
##D )
##D 
##D # define the corresponding Stan density function
##D stan_funs <- "
##D   real beta_binomial2_lpmf(int y, real mu, real phi, int N) {
##D     return beta_binomial_lpmf(y | N, mu * phi, (1 - mu) * phi);
##D   }
##D "
##D 
##D # fit the model
##D fit <- brm(y | trials(ntrials) ~ z, data = dat, 
##D            family = beta_binomial2, stan_funs = stan_funs)
##D summary(fit)
## End(Not run)




