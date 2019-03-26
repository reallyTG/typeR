library(EDMeasure)


### Name: pmdc
### Title: Partial Martingale Difference Correlation
### Aliases: pmdc

### ** Examples

# X, Y, Z are 10 x 2 matrices with 10 samples and 2 variables
X <- matrix(rnorm(10 * 2), 10, 2)
Y <- matrix(rnorm(10 * 2), 10, 2)
Z <- matrix(rnorm(10 * 2), 10, 2)

pmdc(X, Y, Z)



