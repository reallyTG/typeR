library(ELYP)


### Name: CoxEL
### Title: Compute Empirical Likelihood and Partial Likelihood of Cox model
###   for Testing the beta and Baseline Jointly.
### Aliases: CoxEL
### Keywords: nonparametric survival

### ** Examples

## censored regression with one right censored observation.
## we check the estimation equation, with the MLE inside myfun7. 
y <- c(3, 5.3, 6.4, 9.1, 14.1, 15.4, 18.1, 15.3, 14, 5.8, 7.3, 14.4)
x <- c(1, 1.5, 2,   3,   4,    5,    6,    5,    4,  1,   2,   4.5)
d <- c(1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0)



