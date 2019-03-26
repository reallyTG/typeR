library(simsem)


### Name: findIndMean
### Title: Find indicator total means from factor loading matrix, total
###   factor mean, and indicator intercept.
### Aliases: findIndMean

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- c(0.6, 0.7, 0.8)
loading[4:6, 2] <- c(0.6, 0.7, 0.8)
facMean <- c(0.5, 0.2)
intcept <- rep(0, 6)
findIndMean(loading, facMean, intcept)



