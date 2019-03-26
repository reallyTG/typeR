library(cvar)


### Name: ES
### Title: Compute expected shortfall (ES) of distributions
### Aliases: ES

### ** Examples

ES(qnorm)

## Gaussian
ES(qnorm, dist.type = "qf")
ES(pnorm, dist.type = "cdf")

## t-dist
ES(qt, dist.type = "qf", df = 4)
ES(pt, dist.type = "cdf", df = 4)

ES(pnorm, x= 0.95, dist.type = "cdf")
ES(qnorm, x= 0.95, dist.type = "qf")
## - VaRES::esnormal(0.95, 0, 1)
## - PerformanceAnalytics::ETL(p=0.05, method = "gaussian", mu = 0,
##                             sigma = 1, weights = 1)             # same

cvar::ES(pnorm, dist.type = "cdf")
cvar::ES(qnorm, dist.type = "qf")
cvar::ES(pnorm, x= 0.05, dist.type = "cdf")
cvar::ES(qnorm, x= 0.05, dist.type = "qf")

## this uses "pdf"
cvar::ES(dnorm, x = 0.05, dist.type = "pdf", qf = qnorm)


## this gives warning (it does more than simply computing ES):
## PerformanceAnalytics::ETL(p=0.95, method = "gaussian", mu = 0, sigma = 1, weights = 1)

## run this if VaRRES is present
## Not run: 
##D x <- seq(0.01, 0.99, length = 100)
##D y <- sapply(x, function(p) cvar::ES(qnorm, x = p, dist.type = "qf"))
##D yS <- sapply(x, function(p) - VaRES::esnormal(p))
##D plot(x, y)
##D lines(x, yS, col = "blue")
## End(Not run)




