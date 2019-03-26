library(epiGWAS)


### Name: robust_outcome
### Title: Implements the robust modified outcome approach
### Aliases: robust_outcome

### ** Examples

n <- 30
p <- 10
X <- matrix((runif(n * p) < 0.4) + (runif(n * p) < 0.4),
             ncol = p, nrow = n) # SNP matrix
A <- rbinom(n, 1, 0.3)
propensity <- runif(n, min = 0.4, max = 0.8)
Y <- runif(n) < 0.4
robust_scores <- robust_outcome(A, X, Y, propensity,
                               lambda_min_ratio = 0.01 , n_subsample = 1)




