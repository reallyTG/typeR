library(CUSUMdesign)


### Name: getARL
### Title: compute average run length (ARL) for CUSUM charts
### Aliases: getARL
### Keywords: ARL CUSUM Quality control

### ** Examples

# normal mean
getARL(distr=1, K=11, H=5, Mean=10, std=2)

# normal variance
getARL(distr=2, K=3, H=1, std=2, samp.size=5, is.upward=TRUE)

# Poission
getARL(distr=3, K=3, H=1, std=2, Mean=5, is.upward=TRUE)

# Binomial
getARL(distr=4, K=0.8, H=1, prob=0.2, samp.size=100, is.upward=TRUE)

# Negative binomial
getARL(distr=5, K=3, H=6, Mean=2, Var=5, is.upward=TRUE)

# Inverse Gaussian mean
getARL(distr=6, K=2, H=4, mu=3, lambda=0.5, is.upward=TRUE)



