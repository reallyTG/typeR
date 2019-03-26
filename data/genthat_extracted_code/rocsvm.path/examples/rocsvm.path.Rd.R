library(rocsvm.path)


### Name: rocsvm.path
### Title: Fit the entire regularization path for ROC-Support Vector
###   Machine (ROC-SVM)
### Aliases: rocsvm.path

### ** Examples

library(rocsvm.path)
n <- 30
p <- 2
delta <- 1
set.seed(309)
y <- c(rep(1, n/2), rep(-1, n/2))
x <- matrix(0, n, p)
for (i in 1:n){
 if (y[i] == 1) {
 x[i,] <- rnorm(p, -delta, 1)
 } else {
 x[i,] <- rnorm(p, delta, 1)
  }
 }

rho = 1
kernel = radial.kernel
param.kernel  = 1/ncol(x)
prop = 0.1
obj <- rocsvm.path(x, y, rho, kernel, param.kernel, prop)



