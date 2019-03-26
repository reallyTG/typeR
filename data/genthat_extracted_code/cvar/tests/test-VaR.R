library(cvar)
context("VaR")

test_that("VaR works ok", {

muA <- 0.006408553
sigma2A <- 0.0004018977

## with quantile function
res1 <- cvar::VaR(qnorm, x = 0.05, mean = muA, sd = sqrt(sigma2A))
res2 <- cvar::VaR(qnorm, x = 0.05, intercept = muA, slope = sqrt(sigma2A))
abs((res2 - res1)) # 0, intercept/slope equivalent to mean/sd

expect_error(cvar::VaR(dnorm, dist.type = "pdf", x = 0.05, intercept = muA, slope = sqrt(sigma2A)), "Not ready")
cvar::VaR_qf(qnorm, x = 0.05, mean = muA, sd = sqrt(sigma2A))

## with cdf the precision depends on solving an equation
res1a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", mean = muA, sd = sqrt(sigma2A))
res2a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", intercept = muA, slope = sqrt(sigma2A))
abs((res1a - res2)) # 3.287939e-09
abs((res2a - res2)) # 5.331195e-11, intercept/slope better numerically

expect_equal(res1, VaR_qf(qnorm, x = 0.05, mean = muA, sd = sqrt(sigma2A)))
expect_equal(res2a, VaR_cdf(pnorm, x = 0.05, mean = muA, sd = sqrt(sigma2A)))

suppressWarnings(RNGversion("3.5.0")) # 2019-03-13 temporary, RNG changed in R-devel.
                                      #            see email from Kurt Hornik in Org/
set.seed(1236)
a.num <- rnorm(100)
VaR(a.num)
ES(a.num)


## as above, but increase the precision, this is probably excessive
res1b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", mean = muA, sd = sqrt(sigma2A), tol = .Machine$double.eps^0.75)
res2b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", intercept = muA, slope = sqrt(sigma2A), tol = .Machine$double.eps^0.75)

expect_lt( abs((res1b - res2)), 1e-12) # 6.938894e-18 # both within machine precision
expect_lt( abs((res2b - res2)), 1e-12) # 1.040834e-16

## relative precision is also good
abs((res1b - res2)/res2) # 2.6119e-16 # both within machine precision
abs((res2b - res2)/res2) # 3.91785e-15


## an extended example with vector args, if "PerformanceAnalytics" is present
if(require("PerformanceAnalytics")){
    data(edhec, package = "PerformanceAnalytics")
    mu <- apply(edhec, 2, mean)
    sigma2 <- apply(edhec, 2, var)
    musigma2 <- cbind(mu, sigma2)

    ## compute in 2 ways with cvar::VaR
    vAz1 <- cvar::VaR(qnorm, x = 0.05, mean = mu, sd = sqrt(sigma2))
    vAz2 <- cvar::VaR(qnorm, x = 0.05, intercept = mu, slope = sqrt(sigma2))

    vAz1a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                       mean = mu, sd = sqrt(sigma2))
    vAz2a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                       intercept = mu, slope = sqrt(sigma2))

    vAz1b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                   mean = mu, sd = sqrt(sigma2),
                   tol = .Machine$double.eps^0.75)
    vAz2b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                   intercept = mu, slope = sqrt(sigma2),
                   tol = .Machine$double.eps^0.75)

    ## analogous calc. with PerformanceAnalytics::VaR
    vPA <- apply(musigma2, 1, function(x)
        PerformanceAnalytics::VaR(p = .95, method = "gaussian", invert = FALSE,
                                  mu = x[1], sigma = x[2], weights = 1))
    ## the results are numerically the same
    max(abs((vPA - vAz1))) # 5.551115e-17
    max(abs((vPA - vAz2))) #   ""

    max(abs((vPA - vAz1a))) # 3.287941e-09
    max(abs((vPA - vAz2a))) #  1.465251e-10, intercept/slope better

    max(abs((vPA - vAz1b))) # 4.374869e-13
    max(abs((vPA - vAz2b))) # 3.330669e-16
}

})

test_that("ES works ok", {

expect_equal(ES(qnorm, dist.type = "qf"),
             ES(qnorm) )

## Gaussian
expect_equal(ES(qnorm, dist.type = "qf"),
             ES(pnorm, dist.type = "cdf") )


## t-dist
expect_equal(ES(qt, dist.type = "qf", df = 4),
             ES(pt, dist.type = "cdf", df = 4) )

expect_equal(ES(pnorm, x = 0.95, dist.type = "cdf"),
             ES(qnorm, x = 0.95, dist.type = "qf") )
## - VaRES::esnormal(0.95, 0, 1)
## - PerformanceAnalytics::ETL(p=0.05, method = "gaussian", mu = 0,
##                             sigma = 1, weights = 1)             # same


## this uses "pdf"
expect_equal(ES(dnorm, x = 0.05, dist.type = "pdf", qf = qnorm),
             ES(pnorm, x = 0.05, dist.type = "cdf") )

})

