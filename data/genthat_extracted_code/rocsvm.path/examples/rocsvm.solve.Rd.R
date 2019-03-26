library(rocsvm.path)


### Name: rocsvm.solve
### Title: Finding Lagrangian multipliers of ROC-SVM by Qudratic
###   Programming
### Aliases: rocsvm.solve

### ** Examples

## No test: 
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

K <- radial.kernel(x,x)
rocsvm.solve(K, lambda = 1, rho = 1) 
## End(No test)



