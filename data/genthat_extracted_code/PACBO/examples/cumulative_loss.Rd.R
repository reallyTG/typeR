library(PACBO)


### Name: cumulative_loss
### Title: Cumulative Loss
### Aliases: cumulative_loss
### Keywords: internal

### ** Examples

## generating 4 centers of length 3.
centers <- matrix(1:12, nrow = 4, ncol = 3)
## generating 10 observations of length 3.
observations <- matrix(rmnorm(10, mean = c(0,3,5), varcov = diag(1,3)), nrow = 10)
cumulative_loss(centers, observations)



