library(samplingbook)


### Name: Smean
### Title: Sampling Mean Estimation
### Aliases: Smean

### ** Examples

data(pop)
Y <- pop$Y
Y
# Draw a random sample of size=3
set.seed(93456)
y <- sample(x = Y, size = 3)
sort(y)
# Estimation with infiniteness correction
est <- Smean(y = y, N = length(pop$Y))
est



