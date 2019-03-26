library(lognorm)


### Name: estimateParmsLognormFromSample
### Title: estimateParmsLognormFromSample
### Aliases: estimateParmsLognormFromSample

### ** Examples

.mu <- log(1)
.sigma <- log(2)
x <- exp(rnorm(50, mean = .mu, sd = .sigma))
estimateParmsLognormFromSample(x)



