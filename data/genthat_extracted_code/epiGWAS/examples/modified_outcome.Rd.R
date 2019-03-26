library(epiGWAS)


### Name: modified_outcome
### Title: Implements the modified outcome approach
### Aliases: modified_outcome

### ** Examples

n <- 30
p <- 10
X <- matrix((runif(n * p) < 0.5) + (runif(n * p) < 0.5), ncol = p, nrow = n)
A <- (runif(n, min = 0, max = 1) < 0.3)
propensity <- runif(n, min = 0.4, max = 0.8)
Y <- runif(n) < 1/ (1 + exp(- 2 * X[, 5, drop = FALSE]))
auc_scores <- modified_outcome(A, X, Y, propensity,
                               ncores = 1, parallel = TRUE, n_subsample = 1)




