library(DistributionUtils)


### Name: distMode
### Title: Mode of a Unimodal Distribution
### Aliases: distMode
### Keywords: distribution univar

### ** Examples

normRange <- distCalcRange("norm", tol = 10^(-7), mean = 4, sd = 1)
curve(dnorm(x, mean = 4, sd = 1), normRange[1], normRange[2])
abline(v = distMode("norm", mean = 4, sd = 1), col = "blue")



