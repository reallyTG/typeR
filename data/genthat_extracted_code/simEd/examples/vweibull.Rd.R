library(simEd)


### Name: vweibull
### Title: Variate Generator for the Weibull Distribution
### Aliases: vweibull Weibull
### Keywords: distribution

### ** Examples

set.seed(8675309)
vweibull(3, shape = 2, scale = 1)  # inverts stats::runif using stats::qweibull

set.seed(8675309)
vweibull(3, shape = 2, scale = 1, stream = 1)  # inverts rstream.sample using stats::qweibull
vweibull(3, shape = 2, scale = 1, stream = 2)

set.seed(8675309)
vweibull(1, shape = 2, scale = 1, stream = 1)  # inverts rstream.sample using stats::qweibull
vweibull(1, shape = 2, scale = 1, stream = 2)
vweibull(1, shape = 2, scale = 1, stream = 1)
vweibull(1, shape = 2, scale = 1, stream = 2)
vweibull(1, shape = 2, scale = 1, stream = 1)
vweibull(1, shape = 2, scale = 1, stream = 2)

set.seed(8675309)
variates <- vweibull(1000, shape = 2, scale = 1, stream = 1)
set.seed(8675309)
variates <- vweibull(1000, shape = 2, scale = 1, stream = 1, antithetic = TRUE)



