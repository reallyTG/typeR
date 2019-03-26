library(solitude)


### Name: predict.solitude
### Title: Predict method for solitude class
### Aliases: predict.solitude

### ** Examples

set.seed(100)
index      <- sample.int(150, 75)
iris_train <- iris[index, ]
iris_test  <- iris[-index, ]
mo         <- isolation_forest(iris_train)
set.seed(100)
index      <- sample.int(150, 100)
iris_train <- iris[index, ]
iris_test  <- iris[-index, ]
mo         <- isolation_forest(iris_train[, 1:4], seed = 101)
scores     <- predict(mo, iris_test)
summary(scores)
with(iris_test
     , plot(Sepal.Length
            , Sepal.Width
            , col = Species
            , cex = ifelse(scores > 0.58, 2, 1)
            , pch = 20
            )
     )
## Not run: 
##D with(iris_train
##D      , plot(Sepal.Length
##D             , Sepal.Width
##D             , col = Species
##D             , cex = ifelse(predict(mo, iris_train) > 0.6, 2, 1)
##D             , pch = 20
##D             )
##D      )
## End(Not run)



