library(simEd)


### Name: vgamma
### Title: Variate Generator for the Gamma Distribution
### Aliases: vgamma Gamma
### Keywords: distribution

### ** Examples

set.seed(8675309)
vgamma(3, shape = 2, scale = 1)  # inverts stats::runif using stats::qgamma

set.seed(8675309)
vgamma(3, shape = 2, scale = 1, stream = 1)  # inverts rstream::rstream.sample using stats::qgamma
vgamma(3, shape = 2, scale = 1, stream = 2)

set.seed(8675309)
vgamma(1, shape = 2, scale = 1, stream = 1)  # inverts rstream::rstream.sample using stats::qgamma
vgamma(1, shape = 2, scale = 1, stream = 2)
vgamma(1, shape = 2, scale = 1, stream = 1)
vgamma(1, shape = 2, scale = 1, stream = 2)
vgamma(1, shape = 2, scale = 1, stream = 1)
vgamma(1, shape = 2, scale = 1, stream = 2)

set.seed(8675309)
variates <- vgamma(1000, shape = 2, scale = 1, stream = 1)
set.seed(8675309)
variates <- vgamma(1000, shape = 2, scale = 1, stream = 1, antithetic = TRUE)



