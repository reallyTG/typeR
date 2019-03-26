library(intubate)


### Name: e1071
### Title: Interfaces for e1071 package for data science pipelines.
### Aliases: ntbt_svm
### Keywords: intubate magrittr e1071 svm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(e1071)
##D 
##D ## Original function to interface
##D model <- svm(Species ~ ., iris)
##D summary(model)
##D 
##D ## The interface reverses the order of data and formula
##D model <- ntbt_svm(iris, Species ~ .)
##D summary(model)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_svm(Species ~ .) %>%
##D   summary()
## End(Not run)



