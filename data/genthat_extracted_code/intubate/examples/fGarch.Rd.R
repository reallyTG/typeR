library(intubate)


### Name: fGarch
### Title: Interfaces for fGarch package for data science pipelines.
### Aliases: ntbt_garchFit
### Keywords: intubate magrittr fGarch garchFit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(fGarch)
##D 
##D 
##D ## ntbt_garchFit: Univariate GARCH Time Series Fitting
##D N <- 200
##D x.vec <- as.vector(garchSim(garchSpec(rseed = 1985), n = N)[,1])
##D 
##D ## Original function to interface
##D garchFit(~ garch(1,1), data = x.vec, trace = FALSE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_garchFit(data = x.vec, ~ garch(1,1), trace = FALSE)
##D 
##D ## so it can be used easily in a pipeline.
##D x.vec %>%
##D   ntbt_garchFit(~ garch(1,1), trace = FALSE)
## End(Not run)



