library(Pade)


### Encoding: UTF-8

### Name: Pade
### Title: Padé Approximant Coefficients
### Aliases: Pade
### Keywords: NumericalMathematics

### ** Examples

A <- 1 / factorial(seq_len(11) - 1) ## Taylor sequence for e^x up to x^{10} around x_0 = 0
Z <- Pade(5, 5, A)
print(Z)                            ## Padé approximant of order [5 / 5]
X <- -.01                           ## Test value
Actual <- exp(X)                    ## Proper value
print(Actual, digits = 16)
Estimate <- sum(Z[[1]] * X ^ (seq_along(Z[[1]]) - 1)) / sum(Z[[2]] * X ^ (seq_along(Z[[2]]) - 1))
print(Estimate, digits = 16)        ## Approximant value
all.equal(Actual, Estimate)



