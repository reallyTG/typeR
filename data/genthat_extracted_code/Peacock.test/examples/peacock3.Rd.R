library(Peacock.test)


### Name: peacock3
### Title: Three Dimensional Kolmogorov-Smirnov/Peacock Two-Sample test
### Aliases: peacock3
### Keywords: Three-dimensional Kolmogorov-Smirnov/Peacock Two-Sample test
###   Three-dimensional Fasano-Franceschini Two-Sample test

### ** Examples

    x <- matrix(rnorm(12, 0, 1), ncol=3)
    y <- matrix(rnorm(18, 0, 1), ncol=3)
    ks <- peacock3(x, y)
    ks 



