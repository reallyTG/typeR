library(spup)


### Name: genSample.MarginalScalar
### Title: Generating Monte Carlo sample from an uncertain object of a
###   class 'MarginalScalar'
### Aliases: genSample.MarginalScalar

### ** Examples


set.seed(12345)
# Example 1
scalarUM <- defineUM(uncertain = TRUE, distribution = "norm", distr_param = c(10, 1))
scalar_sample <- genSample(scalarUM, n = 10, samplemethod = "randomSampling")

# Example 2
scalarUM <- defineUM(uncertain = TRUE, distribution = "beta", distr_param = c(10, 1, 2))
scalar_sample <- genSample(scalarUM, n = 10, samplemethod = "stratifiedSampling", p = 0:5/5)




