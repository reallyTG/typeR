library(mrbsizeR)


### Name: rmvtDCT
### Title: Sampling from marginal posterior multivariate t-distribution.
### Aliases: rmvtDCT

### ** Examples

# Artificial sample data
set.seed(987)
sampleData <- matrix(stats::rnorm(100), nrow = 10)
sampleData[4:6, 6:8] <- sampleData[4:6, 6:8] + 5

# Sampling from a multivariate t-distribution
t_dist_samp <- rmvtDCT(object = sampleData, lambda = 1, sigma = 10,
                       nu0 = 50, ns = 1000)



