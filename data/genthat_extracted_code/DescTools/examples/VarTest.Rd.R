library(DescTools)


### Name: VarTest
### Title: ChiSquare Test for One Variance and F Test to Compare Two
###   Variances
### Aliases: VarTest VarTest.default VarTest.formula
### Keywords: htest

### ** Examples

x <- rnorm(50, mean = 0, sd = 2)

# One sample test
VarTest(x, sigma.squared = 2.5)

# two samples
y <- rnorm(30, mean = 1, sd = 1)
VarTest(x, y)                  # Do x and y have the same variance?
VarTest(lm(x ~ 1), lm(y ~ 1))  # The same.



