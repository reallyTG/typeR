library(statGraph)


### Name: tang
### Title: Tang hypothesis testing for random graphs.
### Aliases: tang

### ** Examples

require(igraph)
set.seed(42)

## test under H0
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
g1 <- sample_dot_product(lpvs)
g2 <- sample_dot_product(lpvs)
D <- tang(g1,g2, 5, printResult = TRUE)

## test under H1
lpvs2 <- matrix(pnorm(200), 20, 10)
lpvs2 <- apply(lpvs2, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
g2 <- suppressWarnings(sample_dot_product(lpvs2))
D <- tang(g1,g2, 5, printResult = TRUE)





