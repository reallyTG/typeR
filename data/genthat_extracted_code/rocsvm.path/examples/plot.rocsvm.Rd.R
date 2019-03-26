library(rocsvm.path)


### Name: plot.rocsvm
### Title: Plot the rocsvm.path, solution paths of ROC-SVM as a function of
###   lambda
### Aliases: plot.rocsvm

### ** Examples

# The 'obj' comes from an example description of rocsvm.path()
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
plot(obj)
# or plot.rocsvm(obj, lty = 2, lwd = 2, col = 2)




