library(stepR)


### Name: intervalSystem
### Title: Interval systems
### Aliases: intervalSystem intervalsystem

### ** Examples

y <- c(rnorm(50), rnorm(50, 2))

# interval system of all intervals and all lengths
fit <- stepFit(y, alpha = 0.5, intervalSystem = "all", lengths = 1:100,
               jumpint = TRUE, confband = TRUE)

# default for family "gauss" if number of observations is 1000 or less
identical(stepFit(y, alpha = 0.5, jumpint = TRUE, confband = TRUE), fit)

# intervalSystem "dyaLen" and a subset of lengths
## No test: 
!identical(stepFit(y, alpha = 0.5, intervalSystem = "dyaLen", lengths = c(2, 4, 16),
                   jumpint = TRUE, confband = TRUE), fit)

# default for lengths are all possible lengths of the interval system
# and the parametric family
identical(stepFit(y, alpha = 0.5, intervalSystem = "dyaPar",
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, alpha = 0.5, intervalSystem = "dyaPar", lengths = 2^(0:6),
                  jumpint = TRUE, confband = TRUE))

# interval system "dyaPar" is default for parametric family "hsmuce"
# length 1 is not possible for this parametric family
identical(stepFit(y, alpha = 0.5, family = "hsmuce",
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, alpha = 0.5, family = "hsmuce", intervalSystem = "dyaPar",
                  lengths = 2^(1:6), jumpint = TRUE, confband = TRUE))

# interval system "dyaLen" is default for parametric family "mDependentPS"
identical(stepFit(y, alpha = 0.5, family = "mDependentPS", covariances = c(1, 0.5),
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, alpha = 0.5, family = "mDependentPS", covariances = c(1, 0.5),
                  intervalSystem = "dyaLen", lengths = 2^(0:6),
                  jumpint = TRUE, confband = TRUE))
## End(No test)


