library(ncf)


### Name: partial.mantel.test
### Title: Partial Mantel test
### Aliases: partial.mantel.test
### Keywords: spatial

### ** Examples

# first generate some sample data and dissimilarity matrices
x <- rnorm(10)
y <- rnorm(10)
z <- rnorm(10)
M1 <- sqrt(outer(x, x, "-")^2)
M2 <- sqrt(outer(y, y, "-")^2)
M3 <- sqrt(outer(z, z, "-")^2)

partial.mantel.test(M1 = M1, M2 = M2, M3 = M3, resamp = 500)



