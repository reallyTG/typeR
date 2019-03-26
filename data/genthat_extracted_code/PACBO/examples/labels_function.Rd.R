library(PACBO)


### Name: labels_function
### Title: Label Caculation Function
### Aliases: labels_function
### Keywords: internal

### ** Examples

## generating 4 centers of length 3.
centers <- matrix(1:12, nrow = 4, ncol = 3)
## generating 10 observations of length 3.
observations <- matrix(rmnorm(10, mean = c(2,6,10), varcov = diag(1,3)), nrow = 10)
labels_function(centers, observations)



