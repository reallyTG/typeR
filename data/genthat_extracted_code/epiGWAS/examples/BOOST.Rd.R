library(epiGWAS)


### Name: BOOST
### Title: Implements BOOST SNP-SNP interaction test
### Aliases: BOOST

### ** Examples

X <- matrix((runif(500, min = 0, max = 1) < 0.5) +
    (runif(500, min = 0, max = 1) < 0.5), nrow = 50)
A <- (runif(50, min = 0, max = 1) < 0.5) + (runif(50, min = 0, max = 1) < 0.5)
Y <- runif(50, min = 0, max = 1) < 1/(1+exp(-.5 * A * X[, 3] + .25 * A * X[, 7]))
BOOST(A, X, Y)




