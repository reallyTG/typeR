library(epiGWAS)


### Name: stabilityBIG
### Title: Computes the area under the stability path for all covariates
### Aliases: stabilityBIG

### ** Examples

n <- 100
p <- 25
X <- bigmemory::as.big.matrix(matrix(runif(n * p), ncol = p))
Y <- runif(n, min = 0, max = 1) < 0.5
aucBIG <- stabilityBIG(X, Y, family = "binomial", short = TRUE,
                       ncores = 1, n_lambda = 200, n_subsample = 1)




