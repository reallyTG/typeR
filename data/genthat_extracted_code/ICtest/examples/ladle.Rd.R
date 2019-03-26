library(ICtest)


### Name: ladle
### Title: Ladle estimate for an arbitrary matrix
### Aliases: ladle
### Keywords: multivariate

### ** Examples

# Function for computing the left CCA matrix
S_CCA <- function(x, dim){
  x1 <- x[, 1:dim]
  x2 <- x[, -(1:dim)]
  stand <- function(x){
    x <- as.matrix(x)
    x <- sweep(x, 2, colMeans(x), "-")
    eigcov <- eigen(cov(x), symmetric = TRUE)
    x%*%(eigcov$vectors%*%diag((eigcov$values)^(-1/2))%*%t(eigcov$vectors))
  }
  
  x1stand <- stand(x1)
  x2stand <- stand(x2)
  
  crosscov <- cov(x1stand, x2stand)
  
  tcrossprod(crosscov)
}

# Toy data with two canonical components
n <- 200
x1 <- matrix(rnorm(n*5), n, 5)
x2 <- cbind(x1[, 1] + rnorm(n, sd = sqrt(0.5)),
            -1*x1[, 1] + x1[, 2] + rnorm(n, sd = sqrt(0.5)),
            matrix(rnorm(n*3), n, 3))
x <- cbind(x1, x2)

# The ladle estimate
ladle_1 <- ladle(x, S_CCA, dim = 5)
ladleplot(ladle_1)



