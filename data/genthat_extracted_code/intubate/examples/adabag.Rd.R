library(intubate)


### Name: adabag
### Title: Interfaces for adabag package for data science pipelines.
### Aliases: ntbt_autoprune ntbt_bagging.cv ntbt_boosting ntbt_boosting.cv
### Keywords: intubate magrittr adabag autoprune bagging bagging.cv
###   boosting boosting.cv

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(adabag)
##D 
##D 
##D ## ntbt_autoprune: Builds automatically a pruned tree of class rpart
##D ## Original function to interface
##D autoprune(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_autoprune(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_autoprune(Species ~ .)
##D 
##D ## ntbt_bagging: Applies the Bagging algorithm to a data set
##D library(rpart)
##D data(iris)
##D 
##D ## Original function to interface
##D bagging(Species ~ ., data = iris, mfinal = 10)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bagging(iris, Species ~ ., mfinal = 10)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_bagging(Species ~ ., mfinal = 10)
##D 
##D 
##D 
##D ## Original function to interface
##D iris.baggingcv <- bagging.cv(Species ~ ., v = 2, data = iris, mfinal = 10,
##D                              control = rpart.control(cp = 0.01))
##D iris.baggingcv[-1]
##D 
##D ## The interface puts data as first parameter
##D iris.baggingcv <- ntbt_bagging.cv(iris, Species ~ ., v = 2, mfinal = 10,
##D                                   control = rpart.control(cp = 0.01))
##D iris.baggingcv[-1]
##D 
##D ## so it can be used easily in a pipeline.
##D iris.baggingcv <- iris %>%
##D   ntbt_bagging.cv(Species ~ ., v = 2, mfinal = 10,
##D                   control = rpart.control(cp = 0.01))
##D iris.baggingcv[-1]
##D 
##D 
##D ## ntbt_boosting: Applies the AdaBoost.M1 and SAMME algorithms to a data set
##D ## Original function to interface
##D boosting(Species ~ ., data = iris, boos = TRUE, mfinal = 5)
##D 
##D ## The interface puts data as first parameter
##D ntbt_boosting(iris, Species ~ ., boos = TRUE, mfinal = 5)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_boosting(Species ~ ., boos = TRUE, mfinal = 5)
##D 
##D 
##D ## ntbt_boosting.cv: Runs v-fold cross validation with AdaBoost.M1 or SAMME
##D ## Original function to interface
##D iris.boostcv <- boosting.cv(Species ~ ., v = 2, data = iris, mfinal = 10, 
##D                             control = rpart.control(cp = 0.01))
##D iris.boostcv[-1]
##D 
##D ## The interface puts data as first parameter
##D iris.boostcv <- ntbt_boosting.cv(iris, Species ~ ., v = 2, mfinal = 10, 
##D                                  control = rpart.control(cp = 0.01))
##D iris.boostcv[-1]
##D 
##D ## so it can be used easily in a pipeline.
##D iris.boostcv <- iris %>%
##D   ntbt_boosting.cv(Species ~ ., v = 2, mfinal = 10, 
##D                    control = rpart.control(cp = 0.01))
##D iris.boostcv[-1]
## End(Not run)



