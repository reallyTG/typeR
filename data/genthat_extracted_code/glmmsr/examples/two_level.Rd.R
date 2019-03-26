library(glmmsr)


### Name: two_level
### Title: A dataset simulated from a two-level model
### Aliases: two_level
### Keywords: datasets

### ** Examples

# Fit a two-level model with the Laplace approximation to the likelihood
(mod_Laplace <- glmm(response ~ covariate + (1 | cluster), data = two_level,
                     family = binomial, method = "Laplace"))

# or with adaptive Gaussian quadrature
(mod_AGQ <- glmm(response ~ covariate + (1 | cluster), data = two_level,
                 family = binomial, method = "AGQ", control = list(nAGQ = 15)))

# or with the Sequential Reduction approximation
(mod_SR <- glmm(response ~ covariate + (1 | cluster), data = two_level,
                family = binomial, method = "SR", control = list(nSL = 3)))

# in a two-level model, method = "SR" is equivalent to method = "AGQ" with
# nAGQ = 2^(nSL+1) - 1



