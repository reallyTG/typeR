library(rstantools)


### Name: posterior_interval
### Title: Generic function and default method for posterior uncertainty
###   intervals
### Aliases: posterior_interval posterior_interval.default

### ** Examples

# Default method takes a numeric matrix (of posterior draws)
draws <- matrix(rnorm(100 * 5), 100, 5) # fake draws
colnames(draws) <- paste0("theta_", 1:5)
posterior_interval(draws)

# Example using rstanarm package:
# posterior_interval method for 'stanreg' objects
## Not run: 
##D if (require("rstanarm")) {
##D   fit <- stan_glmer(
##D     mpg ~ wt + am + (1|cyl),
##D     data = mtcars,
##D     QR = TRUE,
##D     prior = normal(0, 1),
##D     iter = 500 # to speed up example
##D   )
##D   rstanarm::posterior_interval(fit, prob = 0.5)
##D }
## End(Not run)

# Also see help("posterior_interval", package = "rstanarm")




