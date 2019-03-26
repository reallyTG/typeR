library(epiGWAS)


### Name: epiGWAS
### Title: Runs a selection of epistasis detection methods in a joint
###   manner
### Aliases: epiGWAS

### ** Examples

n <- 20
p <- 8
X <- matrix((runif(n * p) < 0.4) + (runif(n * p) < 0.4),
             ncol = p, nrow = n) # SNP matrix
A <- rbinom(n, 1, 0.3)
propensity <- runif(n, min = 0.4, max = 0.8)
Y <- rnorm(n)
aucs <- epiGWAS(A, X, Y, propensity, lambda_min_ratio = 0.01, parallel = FALSE,
                 shift = 0.2, n_subsample = 1, short = TRUE, eps = 1e-4,
                 methods = c("normalized_outcome", "robust_outcome"))

names(aucs)




