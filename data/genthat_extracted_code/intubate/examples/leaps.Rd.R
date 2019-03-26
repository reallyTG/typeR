library(intubate)


### Name: leaps
### Title: Interfaces for leaps package for data science pipelines.
### Aliases: ntbt_regsubsets
### Keywords: intubate magrittr leaps regsubsets

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(leaps)
##D 
##D ## Original function to interface
##D fit <- regsubsets(Fertility ~ ., data = swiss, nbest = 2)
##D summary(fit)
##D 
##D ## The interface reverses the order of data and formula
##D fit <- ntbt_regsubsets(data = swiss, Fertility ~ ., nbest = 2)
##D summary(fit)
##D 
##D ## so it can be used easily in a pipeline.
##D swiss %>%
##D   ntbt_regsubsets(Fertility ~ ., nbest = 2) %>%
##D   summary()
## End(Not run)



