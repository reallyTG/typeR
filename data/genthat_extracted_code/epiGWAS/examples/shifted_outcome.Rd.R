library(epiGWAS)


### Name: shifted_outcome
### Title: Implements the shifted modified outcome approach
### Aliases: shifted_outcome

### ** Examples

## Not run: 
##D n <- 30
##D p <- 10
##D X <- matrix((runif(n * p) < 0.5) + (runif(n * p) < 0.5),
##D              ncol = p, nrow = n) # SNP matrix
##D A <- (runif(n) < 0.3)
##D propensity <- runif(n, min = 0.4, max = 0.8)
##D Y <- runif(n) < 1/ (1 + exp(-X[, 2, drop = FALSE]))
##D shifted_scores <- shifted_outcome(A, X, Y, propensity,
##D                                shift = 0.1, n_subsample = 1)
## End(Not run)




