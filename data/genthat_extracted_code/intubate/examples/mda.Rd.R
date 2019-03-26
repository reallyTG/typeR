library(intubate)


### Name: mda
### Title: Interfaces for mda package for data science pipelines.
### Aliases: ntbt_fda ntbt_mda
### Keywords: intubate magrittr mda fda mda

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(mda)
##D 
##D ## ntbt_fda: Flexible Discriminant Analysis
##D data(iris)
##D ## Original function to interface
##D fda(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_fda(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_fda(Species ~ .)
##D 
##D ## ntbt_mda: Mixture Discriminant Analysis
##D data(iris)
##D ## Original function to interface
##D mda(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mda(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_mda(Species ~ .)
## End(Not run)



