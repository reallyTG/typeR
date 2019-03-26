library(cvar)


### Name: VaR
### Title: Compute Value-at-Risk (VaR) of distributions
### Aliases: VaR VaR_qf VaR_cdf VaR.default VaR.numeric

### ** Examples

cvar::VaR(qnorm, x = c(0.01, 0.05), dist.type = "qf")

## the following examples use these values:
muA <- 0.006408553
sigma2A <- 0.0004018977

## with quantile function
res1 <- cvar::VaR(qnorm, x = 0.05, mean = muA, sd = sqrt(sigma2A))
res2 <- cvar::VaR(qnorm, x = 0.05, intercept = muA, slope = sqrt(sigma2A))
abs((res2 - res1)) # 0, intercept/slope equivalent to mean/sd

## with cdf the precision depends on solving an equation
res1a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", mean = muA, sd = sqrt(sigma2A))
res2a <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf", intercept = muA, slope = sqrt(sigma2A))
abs((res1a - res2)) # 3.287939e-09
abs((res2a - res2)) # 5.331195e-11, intercept/slope better numerically

## as above, but increase the precision, this is probably excessive
res1b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                   mean = muA, sd = sqrt(sigma2A), tol = .Machine$double.eps^0.75)
res2b <- cvar::VaR(pnorm, x = 0.05, dist.type = "cdf",
                   intercept = muA, slope = sqrt(sigma2A), tol = .Machine$double.eps^0.75)
abs((res1b - res2)) # 6.938894e-18 # both within machine precision
abs((res2b - res2)) # 1.040834e-16

## relative precision is also good
abs((res1b - res2)/res2) # 2.6119e-16 # both within machine precision
abs((res2b - res2)/res2) # 3.91785e-15


## an extended example with vector args, if "PerformanceAnalytics" is present
if (requireNamespace("PerformanceAnalytics", quietly = TRUE)) withAutoprint({
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
})




