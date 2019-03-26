library(EDMeasure)


### Name: mddm
### Title: Martingale Difference Divergence Matrix
### Aliases: mddm

### ** Examples

# X, Y are vectors with 10 samples and 1 variable
X <- rnorm(10)
Y <- rnorm(10)

mddm(X, Y, compute = "C")
mddm(X, Y, compute = "R")

# X, Y are 10 x 2 matrices with 10 samples and 2 variables
X <- matrix(rnorm(10 * 2), 10, 2)
Y <- matrix(rnorm(10 * 2), 10, 2)

mddm(X, Y, compute = "C")
mddm(X, Y, compute = "R")



