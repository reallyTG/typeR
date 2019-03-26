library(ThreeArmedTrials)


### Name: test_RET
### Title: Wald-type test for three-arm trials
### Aliases: test_RET
### Keywords: test waldtype

### ** Examples

# Negative binomially distributed endpoints
# Test for non-inferiority test. lambda_P=8, lambda_R = 4, lambda_E = 5, and phi = 1
# Delta = (lambda_P-lambda_E)/(lambda_P-lambda_R)
xExp <- rnbinom(60, mu = 5, size = 1)
xRef <- rnbinom(40, mu = 4, size = 1)
xPla <- rnbinom(40, mu = 8, size = 1)
Delta <- (8-5) / (8-4)
test_RET(xExp, xRef, xPla, Delta, var_estimation = 'RML', distribution = "negbin")
test_RET(xExp, xRef, xPla, Delta, var_estimation = 'ML', distribution = "negbin")

# Poisson distributed endpoints
# Test for non-inferiority test. lambda_P=8, lambda_R = 4, lambda_E = 5
# Delta = (lambda_P-lambda_E)/(lambda_P-lambda_R)
xExp <- rpois(60, lambda = 5)
xRef <- rpois(40, lambda = 4)
xPla <- rpois(40, lambda = 8)
Delta <- (8-5) / (8-4)
test_RET(xExp, xRef, xPla, Delta, var_estimation = 'RML', distribution = "poisson")
test_RET(xExp, xRef, xPla, Delta, var_estimation = 'ML', distribution = "poisson")

# Censored exponential distributed endpoints
# Test for non-inferiority test. lambda_P=3, lambda_R = 1, lambda_E = 2
# Probability for uncensored observation: 0.9
# Delta = (lambda_P-lambda_E)/(lambda_P-lambda_R)
x_exp <- matrix(c(rexp(40, rate = 1/2), rbinom(40, size = 1, prob = 0.9)),
                 ncol = 2, byrow = FALSE)
x_ref <- matrix(c(rexp(40, rate = 1/1), rbinom(40, size = 1, prob = 0.9)),
                 ncol = 2, byrow = FALSE)
x_pla <- matrix(c(rexp(40, rate = 1/3), rbinom(40, size = 1, prob = 0.9)),
                 ncol = 2, byrow = FALSE)
Delta <- log(2/3) / log(1/3)
test_RET(xExp = x_exp,
                 xRef = x_ref,
                 xPla = x_pla,
                 Delta = Delta,
                 distribution = "exponential")



