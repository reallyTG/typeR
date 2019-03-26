library(mclust)


### Name: mvn
### Title: Univariate or Multivariate Normal Fit
### Aliases: mvn
### Keywords: cluster

### ** Examples

n <- 1000

set.seed(0)
x <- rnorm(n, mean = -1, sd = 2)
mvn(modelName = "X", x) 

mu <- c(-1, 0, 1)

set.seed(0)
x <- sweep(matrix(rnorm(n*3), n, 3) %*% (2*diag(3)), 
           MARGIN = 2, STATS = mu, FUN = "+")
mvn(modelName = "XII", x) 
mvn(modelName = "Spherical", x) 

set.seed(0)
x <- sweep(matrix(rnorm(n*3), n, 3) %*% diag(1:3), 
           MARGIN = 2, STATS = mu, FUN = "+")
mvn(modelName = "XXI", x)
mvn(modelName = "Diagonal", x)

Sigma <- matrix(c(9,-4,1,-4,9,4,1,4,9), 3, 3)
set.seed(0)
x <- sweep(matrix(rnorm(n*3), n, 3) %*% chol(Sigma), 
           MARGIN = 2, STATS = mu, FUN = "+")
mvn(modelName = "XXX", x) 
mvn(modelName = "Ellipsoidal", x) 



