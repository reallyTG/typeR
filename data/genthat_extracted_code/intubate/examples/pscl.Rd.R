library(intubate)


### Name: pscl
### Title: Interfaces for pscl package for data science pipelines.
### Aliases: ntbt_hurdle ntbt_zeroinfl
### Keywords: intubate magrittr pscl hurdle zeroinfl

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(pscl)
##D 
##D 
##D ## ntbt_hurdle: Hurdle Models for Count Data Regression
##D data("bioChemists", package = "pscl")
##D 
##D ## Original function to interface
##D hurdle(art ~ ., data = bioChemists)
##D 
##D ## The interface puts data as first parameter
##D ntbt_hurdle(bioChemists, art ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D bioChemists %>%
##D   ntbt_hurdle(art ~ .)
##D 
##D 
##D ## ntbt_zeroinfl: Zero-inflated Count Data Regression
##D ## Original function to interface
##D zeroinfl(art ~ . | 1, data = bioChemists, dist = "negbin")
##D 
##D ## The interface puts data as first parameter
##D ntbt_zeroinfl(bioChemists, art ~ . | 1, dist = "negbin")
##D 
##D ## so it can be used easily in a pipeline.
##D bioChemists %>%
##D   ntbt_zeroinfl(art ~ . | 1, dist = "negbin")
## End(Not run)



