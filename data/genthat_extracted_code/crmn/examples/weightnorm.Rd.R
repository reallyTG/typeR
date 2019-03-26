library(crmn)


### Name: weightnorm
### Title: Normalize by sample weight
### Aliases: weightnorm

### ** Examples

data(mix)
w <- runif(ncol(mix),1, 1.3)
weightnorm(mix, w)



