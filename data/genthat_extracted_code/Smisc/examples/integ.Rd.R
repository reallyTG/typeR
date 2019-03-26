library(Smisc)


### Name: integ
### Title: Simple numerical integration routine
### Aliases: integ
### Keywords: math

### ** Examples

# The Beta density from 0 to 0.7
integ(dbeta(seq(0, 0.7, length = 401), 2, 5), a = 0, b = 0.7)

# Checking result with the cdf
pbeta(0.7, 2, 5)

# f(x) = x^2 from 0 to 3
integ(seq(0, 3, length = 21)^2, a = 0, b = 3)

# A quadratic function with both methods
x <- seq(0, 3, length = 51)
integ(x^2, x = x, method = "t")
integ(x^2, a = 0, b = 3, method = "s")

# Now a linear function
x <- seq(0, 2, length = 3)
y <- 2 * x + 3
integ(y, x = x, method = "t")
integ(y, a = 0, b = 2)



