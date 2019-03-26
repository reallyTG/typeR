library(simEd)


### Name: vbinom
### Title: Variate Generator for the Binomial Distribution
### Aliases: vbinom Binomial
### Keywords: distribution

### ** Examples

set.seed(8675309)
vbinom(3, size = 10, prob = 0.3)  # inverts stats::runif using stats::qbinom

set.seed(8675309)
vbinom(3, 10, 0.3, stream = 1) # inverts rstream::rstream.sample using stats::qbinom
vbinom(3, 10, 0.3, stream = 2)

set.seed(8675309)
vbinom(1, 10, 0.3, stream = 1) # inverts rstream::rstream.sample using stats::qbinom
vbinom(1, 10, 0.3, stream = 2)
vbinom(1, 10, 0.3, stream = 1)
vbinom(1, 10, 0.3, stream = 2)
vbinom(1, 10, 0.3, stream = 1)
vbinom(1, 10, 0.3, stream = 2)

set.seed(8675309)
variates <- vbinom(1000, size = 10, prob = 0.3, stream = 1)
set.seed(8675309)
variates <- vbinom(1000, size = 10, prob = 0.3, stream = 1, antithetic = TRUE)



