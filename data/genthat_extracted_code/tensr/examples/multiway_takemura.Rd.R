library(tensr)


### Name: multiway_takemura
### Title: Calculate a truncated multiway Takemura estimator.
### Aliases: multiway_takemura
### Keywords: equivariance

### ** Examples

# Simulate data.
p <- c(5, 5, 5)
X <- array(stats::rnorm(prod(p)), dim = p)
multi_out <- multiway_takemura(X, mode_rep = 3)
multi_out$b
trim(multi_out$B[[1]])
trim(multi_out$B[[2]])
trim(multi_out$B[[3]])



