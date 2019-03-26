library(ARHT)


### Name: ARHT
### Title: An adaptable generalized Hotelling's T^2 test for high
###   dimensional data
### Aliases: ARHT

### ** Examples

set.seed(10086)
# One-sample test
n1 = 300; p =500
dataX = matrix(rnorm(n1 * p), nrow = n1, ncol = p)
res1 = ARHT(dataX)

# Two-sample test
n2= 400
dataY = matrix(rnorm(n2 * p), nrow = n2, ncol = p )
res2 = ARHT(dataX, dataY, mu_0 = rep(0.01,p))

# Specify probabilistic alternative priors model
res3 = ARHT(dataX, dataY, mu_0 = rep(0.01,p),
     prob_alt_prior = list(c(1/3, 1/3, 1/3), c(0,1,0)))

# Change Type 1 error calibration method
res4 = ARHT(dataX, dataY, mu_0 = rep(0.01,p),
     Type1error_calib = "sqrt")

RejectOrNot = res4$ARHT_pvalue < 0.05




