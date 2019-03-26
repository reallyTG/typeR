library(heemod)


### Name: distributions
### Title: Probability Density Functions for Probabilistic Uncertainty
###   Analysis
### Aliases: distributions normal lognormal gamma binomial multinomial
###   logitnormal beta triangle poisson define_distribution beta triangle
###   use_distribution

### ** Examples

define_distribution(
  function(x) stats::qexp(p = x, rate = 0.5)
)

# a mixture of 2 gaussians
x <- c(rnorm(100), rnorm(100, 6))
plot(density(x))

use_distribution(x)



