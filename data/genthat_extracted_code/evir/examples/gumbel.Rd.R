library(evir)


### Name: gumbel
### Title: Fit Gumbel Distribution
### Aliases: gumbel
### Keywords: models

### ** Examples

# Fit Gumbel to maxima of blocks of 100 observations
data(bmw)
out <- gumbel(bmw, 100) 
# Fit Gumbel to the data in nidd.annual, the annual maximum water 
# levels of the River Nidd, using the "BFGS" optimization method
data(nidd.annual)
out <- gumbel(nidd.annual, method = "BFGS", control = list(maxit = 500))



