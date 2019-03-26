library(broom)


### Name: mcmc_tidiers
### Title: Tidying methods for MCMC (Stan, JAGS, etc.) fits
### Aliases: mcmc_tidiers tidyMCMC tidy.rjags tidy.stanfit

### ** Examples


## Not run: 
##D 
##D # Using example from "RStan Getting Started"
##D # https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
##D 
##D model_file <- system.file("extdata", "8schools.stan", package = "broom")
##D 
##D schools_dat <- list(J = 8,
##D                     y = c(28,  8, -3,  7, -1,  1, 18, 12),
##D                     sigma = c(15, 10, 16, 11,  9, 11, 10, 18))
##D 
##D if (requireNamespace("rstan", quietly = TRUE)) {
##D   set.seed(2015)
##D   rstan_example <- stan(file = model_file, data = schools_dat,
##D                         iter = 100, chains = 2)
##D }
##D 
## End(Not run)

if (requireNamespace("rstan", quietly = TRUE)) {
  # the object from the above code was saved as rstan_example.rda
  infile <- system.file("extdata", "rstan_example.rda", package = "broom")
  load(infile)

  tidy(rstan_example)
  tidy(rstan_example, conf.int = TRUE, pars = "theta")

  td_mean <- tidy(rstan_example, conf.int = TRUE)
  td_median <- tidy(rstan_example, conf.int = TRUE, estimate.method = "median")

  library(dplyr)
  library(ggplot2)
  tds <- rbind(mutate(td_mean, method = "mean"),
               mutate(td_median, method = "median"))

  ggplot(tds, aes(estimate, term)) +
    geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    geom_point(aes(color = method))
}





