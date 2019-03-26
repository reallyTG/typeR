library(evir)


### Name: gev
### Title: Fit Generalized Extreme Value Distribution
### Aliases: gev
### Keywords: models

### ** Examples

# Fit GEV to monthly maxima
data(bmw)
out <- gev(bmw, "month") 
# Fit GEV to maxima of blocks of 100 observations
out <- gev(bmw, 100) 
# Fit GEV to the data in nidd.annual, the annual maximum water 
# levels of the River Nidd, using the "BFGS" optimization method
data(nidd.annual) 
out <- gev(nidd.annual, method = "BFGS", control = list(maxit = 500))   



