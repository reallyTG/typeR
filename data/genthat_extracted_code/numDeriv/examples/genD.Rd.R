library(numDeriv)


### Name: genD
### Title: Generate Bates and Watts D Matrix
### Aliases: genD genD.default
### Keywords: multivariate

### ** Examples

    func <- function(x){c(x[1], x[1], x[2]^2)}
    z <- genD(func, c(2,2,5))



