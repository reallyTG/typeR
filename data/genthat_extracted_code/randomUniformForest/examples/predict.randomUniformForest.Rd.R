library(randomUniformForest)


### Name: predict.randomUniformForest
### Title: Predict method for random Uniform Forests objects
### Aliases: predict.randomUniformForest predict

### ** Examples

## same as randomForest example
#  data(iris)
# set.seed(111)
# ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.8, 0.2))

# iris.ruf <- randomUniformForest(Species ~ ., data = iris[ind == 1,], OOB = FALSE, 
# importance = FALSE, threads = 1)
# iris.pred <- predict(iris.ruf, iris[ind == 2,])

# table(observed = iris[ind == 2, "Species"], predicted = iris.pred)

## get all votes : note that aliases of classes are used internally and, for intermediate
## results, are not converted to their true values
# iris.all.votes <- predict(iris.ruf, iris[ind == 2,], type = "votes")

## get class probabilities
# iris.class.prob <- predict(iris.ruf, iris[ind == 2,], type = "prob")
# iris.class.prob



