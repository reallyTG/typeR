library(semTools)


### Name: monteCarloMed
### Title: Monte Carlo Confidence Intervals to Test Complex Indirect
###   Effects
### Aliases: monteCarloMed

### ** Examples


## Simple two path mediation
## Write expression of indirect effect
med <- 'a*b'
## Paramter values from analyses
aparam <- 1
bparam <- 2
## Asymptotic covariance matrix from analyses
AC <- matrix(c(.01,.00002,
               .00002,.02), nrow=2, byrow=TRUE)
## Compute CI, include a plot
monteCarloMed(med, coef1 = aparam, coef2 = bparam, outputValues = FALSE,
              plot = TRUE, ACM = AC)

## Use a vector of parameter estimates as input
aparam <- c(1,2)
monteCarloMed(med, coef1 = aparam, outputValues = FALSE,
              plot = TRUE, ACM = AC)


## Complex mediation with two paths for the indirect effect
## Write expression of indirect effect
med <- 'a1*b1 + a1*b2'
## Paramter values and standard errors from analyses
aparam <- 1
b1param <- 2
b2param <- 1
## Asymptotic covariance matrix from analyses
AC <- matrix(c(1, .00002, .00003,
               .00002, 1, .00002,
               .00003, .00002, 1), nrow = 3, byrow = TRUE)
## Compute CI do not include a plot
monteCarloMed(med, coef1 = aparam, coef2 = b1param,
              coef3 = b2param, ACM = AC)




