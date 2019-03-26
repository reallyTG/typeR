library(epiGWAS)


### Name: normalized_outcome
### Title: Implements the normalized modified outcome approach
### Aliases: normalized_outcome

### ** Examples

n <- 30
p <- 10
X <- matrix((runif(n * p) < 0.5) + (runif(n * p) < 0.5),
             ncol = p, nrow = n) # SNP matrix
A <- (runif(n) < 0.3)
propensity <- runif(n, min = 0.4, max = 0.8)
Y <- runif(n) < 0.4
normalized_scores <- normalized_outcome(A, X, Y, propensity,
                               lambda_min_ratio = 0.02 , n_subsample = 1)




