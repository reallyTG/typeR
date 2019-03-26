library(simsem)


### Name: findIndIntercept
### Title: Find indicator intercepts from factor loading matrix, total
###   factor mean, and indicator mean.
### Aliases: findIndIntercept

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- c(0.6, 0.7, 0.8)
loading[4:6, 2] <- c(0.6, 0.7, 0.8)
facMean <- c(0.5, 0.2)
indMean <- rep(1, 6)
findIndIntercept(loading, facMean, indMean)



