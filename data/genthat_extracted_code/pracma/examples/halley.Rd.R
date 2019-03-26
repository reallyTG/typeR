library(pracma)


### Name: halley
### Title: Halley's Root Finding Mathod
### Aliases: halley
### Keywords: math

### ** Examples

halley(sin, 3.0)        # 3.14159265358979 in the 3 iterations
halley(function(x) x*exp(x) - 1, 1.0)
                        # 0.567143290409784 Gauss' omega constant

# Legendre polynomial of degree 5
lp5 <- c(63, 0, -70, 0, 15, 0)/8
f <- function(x) polyval(lp5, x)
halley(f, 1.0)          # 0.906179845938664



