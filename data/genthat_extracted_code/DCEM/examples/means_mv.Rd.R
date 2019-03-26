library(DCEM)


### Name: means_mv
### Title: means_mv: Part of DCEM package.
### Aliases: means_mv

### ** Examples

# Generate random samples from a multivariate distribution.
sample_data = MASS::mvrnorm(n=10, rep(10,5), Sigma = diag(5))

# Get the mean(s) from the data
means_mv(sample_data, num_means=2)




