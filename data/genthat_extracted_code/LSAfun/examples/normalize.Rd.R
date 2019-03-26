library(LSAfun)


### Name: normalize
### Title: Normalize a vector
### Aliases: normalize

### ** Examples
normalize(1:2)


## check vector norms:

x <- 1:2

sqrt(sum(x^2))              ## vector norm
sqrt(sum(normalize(x)^2))   ## norm = 1




