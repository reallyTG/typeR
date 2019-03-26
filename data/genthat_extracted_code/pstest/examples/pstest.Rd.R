library(pstest)


### Name: pstest
### Title: pstest: Tests for the Propensity Score
### Aliases: pstest

### ** Examples

# Example based on simulation data
# Simulate vector of covariates
set.seed(1234)
x1 <- runif(100)
x2 <- rt(100, 5)
x3 <- rpois(100, 3)
# generate treatment status score based on Probit Specification
treat <- (x1 + x2 + x3 >= rnorm(100, 4, 5))
# estimate correctly specified propensity score based on Probit
pscore <- stats::glm(treat ~ x1 + x2 + x3, family = binomial(link = "probit"),
              x = TRUE)
# Test the correct specification of estimated propensity score, using
# the weight function 'ind', and bootstrap based on 'Mammen'.
pstest(d = pscore$y, pscore = pscore$fit, xpscore = pscore$x,
       model = "probit", w = "ind", dist = "Mammen")
# Alternatively, one can use the 'sin' weight function
pstest(d = pscore$y, pscore = pscore$fit, xpscore = pscore$x,
       model = "probit", w = "sin", dist = "Mammen")




