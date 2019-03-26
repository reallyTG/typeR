library(VeryLargeIntegers)


### Name: 11. Extended Euclidean algorithm
### Title: Extended Euclidean Algorithm for vli Objects
### Aliases: '11. Extended Euclidean algorithm' exteuclid exteuclid.default
###   exteuclid.numeric exteuclid.vli

### ** Examples

x <- as.vli("232636113097")
y <- as.vli("52442092785616")
result <- exteuclid(x, y)
( result[[2]] * x ) + ( result[[3]] * y )



