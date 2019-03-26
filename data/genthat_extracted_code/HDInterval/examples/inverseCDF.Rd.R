library(HDInterval)


### Name: inverseCDF
### Title: Inverse Cumulative Density Function
### Aliases: inverseCDF
### Keywords: distribution

### ** Examples

# Try with pgamma/qgamma
inverseCDF(c(0.025, 0.975), pgamma, shape=2.5, rate=2) # 95% interval
qgamma(c(0.025, 0.975), shape=2.5, rate=2) # for comparison

# Plug inverseCDF into hdi, need to specify the CDF
hdi(inverseCDF, CDF=pgamma, shape=2.5, rate=2)
hdi(qgamma, shape=2.5, rate=2) # for comparison

# for a custom density, here a mixture of normals
# the PDF
dmixg <- function(x)
  0.6 * dnorm(x, 0, 1) + 0.4 * dnorm(x, 4, 2^0.5)
curve(dmixg, -5, 10)
# and the CDF
pmixg <- function(q)
  0.6 * pnorm(q, 0, 1) + 0.4 * pnorm(q, 4, 2^0.5)
curve(pmixg, -5, 10)
# Now plug into inverseCDF and hdi
inverseCDF(c(0.025, 0.975), pmixg)
hdi(inverseCDF, CDF=pmixg)



