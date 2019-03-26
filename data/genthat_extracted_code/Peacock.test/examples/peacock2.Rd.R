library(Peacock.test)


### Name: peacock2
### Title: Two Dimensional Kolmogorov-Smirnov/Peacock Two-Sample test
### Aliases: peacock2
### Keywords: Two-dimensional Kolmogorov-Smirnov/Peacock Two-Sample test
###   Two-dimensional Fasano-Franceschini Two-Sample test

### ** Examples

    x <- matrix(rnorm(12, 0, 1), ncol=2)
    y <-  matrix(rnorm(16, 0, 1), ncol=2)
    ks <- peacock2(x, y)
    ks



