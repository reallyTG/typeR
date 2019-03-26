library(Peacock.test)


### Name: Peacock.test-package
### Title: Multidimensional Kolmogorov-Smirnov Two-Sample Test
### Aliases: Peacock.test-package Peacock.test
### Keywords: Kolmogorov-Smirnov/Peacock Two-Sample test
###   Fasano-Franceschini Two-Sample test

### ** Examples

# two-dimensional case 
    x2 <- matrix(rnorm(12, 0, 1), ncol=2)
    y2 <- matrix(rnorm(16, 0, 1), ncol=2)
    ks2 <- peacock2(x2, y2)
    ks2
# three-dimensional case 
    x3 <- matrix(rnorm(12, 0, 1), ncol=3)
    y3 <- matrix(rnorm(18, 0, 1), ncol=3)
    ks3 <- peacock3(x3, y3)
    ks3 



