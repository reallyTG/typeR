library(psychmeta)


### Name: simulate_matrix
### Title: Generate a list of simulated sample matrices sampled from the
###   Wishart distribution
### Aliases: simulate_matrix
### Keywords: distribution

### ** Examples

## Define a hypothetical matrix:
sigma <- reshape_vec2mat(cov = .4, order = 5)

## Simualte a list of unstandardized covariance matrices:
simulate_matrix(sigma = sigma, n = 50, k = 10, as_cor = FALSE)

## Simualte a list of correlation matrices:
simulate_matrix(sigma = sigma, n = 50, k = 10, as_cor = TRUE)



