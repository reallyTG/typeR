library(hit)


### Name: as.hierarchy
### Title: Hierarchy Structure
### Aliases: as.hierarchy

### ** Examples

##
set.seed(123)
n <- 80
p <- 90
# x with correlated columns
corMat <- toeplitz((p:1/p)^3)
corMatQ <- chol(corMat)
x <- matrix(rnorm(n * p), nrow = n) %*% corMatQ
colnames(x) <- paste0("x", 1:p)
# hierarchy
hc <- hclust(dist(t(x)))
hier <- as.hierarchy(hc)




