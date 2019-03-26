library(simEd)


### Name: vunif
### Title: Variate Generator for the Uniform Distribution
### Aliases: vunif Uniform
### Keywords: distribution

### ** Examples

set.seed(8675309)
vunif(3)  # inverts stats::runif using stats::qunif

set.seed(8675309)
vunif(3, min = -2, max = 2)  # inverts stats::runif using stats::qunif

set.seed(8675309)
vunif(3, -2, 2, stream = 1) # inverts rstream::rstream.sample using stats::qunif
vunif(3, -2, 2, stream = 2)

set.seed(8675309)
vunif(1, -2, 2, stream = 1) # inverts rstream::rstream.sample using stats::qunif
vunif(1, -2, 2, stream = 2)
vunif(1, -2, 2, stream = 1)
vunif(1, -2, 2, stream = 2)
vunif(1, -2, 2, stream = 1)
vunif(1, -2, 2, stream = 2)

set.seed(8675309)
variates <- vunif(1000, min = 0, max = 10, stream = 1)
set.seed(8675309)
variates <- vunif(1000, min = 0, max = 10, stream = 1, antithetic = TRUE)



