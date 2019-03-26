library(NestedCategBayesImpute)


### Name: groupcount
### Title: Generate 2D count table for two integer-valued vectors.
### Aliases: groupcount

### ** Examples

n1 <- 20
n2 <- 10
g1 <- sample.int(n1,1000, replace = TRUE)
g2 <- sample.int(n2,1000, replace = TRUE)
counts <- groupcount(g1,g2,n1,n2)



