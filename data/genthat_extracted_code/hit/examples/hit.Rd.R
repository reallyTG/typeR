library(hit)


### Name: hit
### Title: Hierarchical Inference Testing
### Aliases: hit

### ** Examples


# Simulation:
set.seed(123)
n <- 80
p <- 82
## x with correlated columns
corMat <- toeplitz((p:1/p)^2)
corMatQ <- chol(corMat)
x <- matrix(rnorm(n * p), nrow = n) %*% corMatQ
colnames(x) <- paste0("x", 1:p)
## y
mu <- x[, c(5, 10, 72)] %*% c(2, -2, 2)
y <-  rnorm(n, mu)
## clustering of the clumns of x
hc <- hclust(dist(t(x)))

# HIT with AF
out <- hit(x, y, hc)
summary(out)




