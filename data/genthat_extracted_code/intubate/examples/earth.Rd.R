library(intubate)


### Name: earth
### Title: Interfaces for earth package for data science pipelines.
### Aliases: ntbt_earth
### Keywords: intubate magrittr earth

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(earth)
##D 
##D ## ntbt_earth: Multivariate Adaptive Regression Splines
##D ## Original function to interface
##D earth(Volume ~ ., data = trees)
##D 
##D ## The interface puts data as first parameter
##D ntbt_earth(trees, Volume ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D trees %>%
##D   ntbt_earth(Volume ~ .)
## End(Not run)



