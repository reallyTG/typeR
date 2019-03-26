library(EDMeasure)


### Name: mdc
### Title: Martingale Difference Correlation
### Aliases: mdc

### ** Examples

# X, Y are 10 x 2 matrices with 10 samples and 2 variables
X <- matrix(rnorm(10 * 2), 10, 2)
Y <- matrix(rnorm(10 * 2), 10, 2)

mdc(X, Y, center = "U")
mdc(X, Y, center = "D")



