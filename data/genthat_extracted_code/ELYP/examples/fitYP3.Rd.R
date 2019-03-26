library(ELYP)


### Name: fitYP3
### Title: Compute Baseline Hazard for the Given Data, Given Parameters:
###   beta1, beta2, lam, and fun.  Also, Given the Baseline, Compute the
###   empirical likelihood value.
### Aliases: fitYP3
### Keywords: nonparametric survival

### ** Examples

## censored regression with one right censored observation.
## we check the estimation equation, with the MLE inside myfun7. 
y <- c(3, 5.3, 6.4, 9.1, 14.1, 15.4, 18.1, 15.3, 14, 5.8, 7.3, 14.4)
x <- c(1, 1.5, 2,   3,   4,    5,    6,    5,    4,  1,   2,   4.5)
d <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0)



