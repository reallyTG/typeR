library(intubate)


### Name: randomForest
### Title: Interfaces for randomForest package for data science pipelines.
### Aliases: ntbt_randomForest
### Keywords: intubate magrittr randomForest

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(randomForest)
##D 
##D ## randomForest
##D ## Original function to interface
##D set.seed(71)
##D iris.rf <- randomForest(Species ~ ., data = iris,
##D                         importance = TRUE, proximity = TRUE)
##D print(iris.rf)
##D plot(iris.rf)
##D 
##D ## The interface reverses the order of data and formula
##D set.seed(71)
##D iris.rf <- ntbt_randomForest(iris, Species ~ .,
##D                              importance = TRUE, proximity = TRUE)
##D print(iris.rf)
##D plot(iris.rf)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(71)
##D iris %>%
##D   ntbt_randomForest(Species ~ ., importance = TRUE,
##D                     proximity = TRUE) %>%
##D   plot()
## End(Not run)



