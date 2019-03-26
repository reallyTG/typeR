library(stepR)


### Name: penalty
### Title: Penalties
### Aliases: penalty penalties

### ** Examples

set.seed(1)
y <- c(rnorm(50), rnorm(50, 2))

# penalty "sqrt"
fit <- stepFit(y, alpha = 0.5, penalty = "sqrt", jumpint = TRUE, confband = TRUE)

# default for family "gauss"
identical(stepFit(y, alpha = 0.5, jumpint = TRUE, confband = TRUE), fit)

# penalty "weights"
!identical(stepFit(y, alpha = 0.5, penalty = "weights",
                   jumpint = TRUE, confband = TRUE), fit)

# penalty "weights" is default for parametric family "hsmuce"
# by default equal weights are chosen
identical(stepFit(y, alpha = 0.5, family = "hsmuce",
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, alpha = 0.5, family = "hsmuce", penalty = "weights",
                  weights = rep(1 / 6, 6), jumpint = TRUE, confband = TRUE))

# different weights
!identical(stepFit(y, alpha = 0.5, family = "hsmuce", weights = 6:1 / sum(6:1),
                   jumpint = TRUE, confband = TRUE),
           stepFit(y, alpha = 0.5, family = "hsmuce", penalty = "weights",
                   weights = rep(1 / 6, 6), jumpint = TRUE, confband = TRUE))

# penalty "sqrt is default for parametric family "mDependentPS"
identical(stepFit(y, alpha = 0.5, family = "mDependentPS", covariances = c(1, 0.5),
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, alpha = 0.5, family = "mDependentPS", covariances = c(1, 0.5),
                  penalty = "sqrt", jumpint = TRUE, confband = TRUE))




