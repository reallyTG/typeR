library(MXM)


### Name: IAMB variable selection
### Title: IAMB variable selection
### Aliases: iamb
### Keywords: Backward regression Markov Blanket Variable Selection

### ** Examples

set.seed(123)
dataset <- matrix( runif(100 * 100, 1, 100), ncol = 100 )
target <- rnorm(100)

target = rpois(100, 10)
a1 <- iamb(target, dataset, threshold = 0.05, stopping = "BIC", tol = 0, back = "iambbs")
a2 <- iamb(target, dataset, threshold = 0.05, stopping = "BIC", tol = 0, back = "bs")



