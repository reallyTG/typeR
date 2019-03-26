library(permute)


### Name: nobs-methods
### Title: Number of observations in a given object
### Aliases: nobs-methods nobs.numeric nobs.integer nobs.matrix
###   nobs.data.frame nobs.factor nobs.character

### ** Examples

## numeric vector
len <- sample(1:10, 1)
v <- as.numeric(sample(1:100, len))
len
obs <- nobs(v)
isTRUE(all.equal(len, obs))

## integer
len <- sample(1L:10L, 1)
obs <- nobs(len)
isTRUE(all.equal(len, obs))




