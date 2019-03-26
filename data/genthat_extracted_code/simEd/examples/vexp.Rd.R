library(simEd)


### Name: vexp
### Title: Variate Generator for the Exponential Distribution
### Aliases: vexp Exponential
### Keywords: distribution

### ** Examples

set.seed(8675309)
vexp(3)  # inverts stats::runif using stats::qexp

set.seed(8675309)
vexp(3, rate = 2)  # inverts stats::runif using stats::qexp

set.seed(8675309)
vexp(3, rate = 2, stream = 1) # inverts rstream::rstream.sample using stats::qexp
vexp(3, rate = 2, stream = 2)

set.seed(8675309)
vexp(1, rate = 2, stream = 1) # inverts rstream::rstream.sample using stats::qexp
vexp(1, rate = 2, stream = 2)
vexp(1, rate = 2, stream = 1)
vexp(1, rate = 2, stream = 2)
vexp(1, rate = 2, stream = 1)
vexp(1, rate = 2, stream = 2)

set.seed(8675309)
interarrivals <- vexp(1000, rate = 1,    stream = 1)
services      <- vexp(1000, rate = 10/9, stream = 2)

set.seed(8675309)
interarrivals <- vexp(1000, rate = 1,    stream = 1, antithetic = TRUE)
services      <- vexp(1000, rate = 10/9, stream = 2, antithetic = TRUE)



