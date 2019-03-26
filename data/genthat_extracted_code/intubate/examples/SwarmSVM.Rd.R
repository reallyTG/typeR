library(intubate)


### Name: SwarmSVM
### Title: Interfaces for SwarmSVM package for data science pipelines.
### Aliases: ntbt_alphasvm
### Keywords: intubate magrittr SwarmSVM alphasvm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(SwarmSVM)
##D 
##D ## ntbt_alphasvm: Support Vector Machines taking initial alpha values
##D data(iris)
##D ## Original function to interface
##D alphasvm(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_alphasvm(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_alphasvm(Species ~ .)
## End(Not run)



