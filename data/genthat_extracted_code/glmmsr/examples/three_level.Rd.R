library(glmmsr)


### Name: three_level
### Title: A dataset simulated from a three-level model
### Aliases: three_level
### Keywords: datasets

### ** Examples

# Fit a three-level model with the Laplace approximation to the likelihood
(mod_Laplace <- glmm(response ~ covariate + (1 | cluster) + (1 | group),
                     data = three_level, family = binomial,
                     method = "Laplace"))

# if we try to fit with adaptive Gaussian quadrature, we get an error
## Not run: 
##D   (mod_AGQ <- glmm(response ~ covariate + (1 | cluster) + (1 | group),
##D                    data = three_level, family = binomial, method = "AGQ",
##D                    control = list(nAGQ = 15)))
## End(Not run)

# We can fit with the Sequential Reduction approximation
## Not run: 
##D   (mod_SR <- glmm(response ~ covariate + (1 | cluster) + (1 | group),
##D                   data = three_level, family = binomial, method = "SR",
##D                   control = list(nSL = 3)))
## End(Not run)
# the estimates of the random effects standard deviations
# are larger than those using the Laplace approximation



