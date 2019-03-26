## ------------------------------------------------------------------------
library(crtests)
library(randomForest)
library(caret)

data(iris)
# A classification test
test <- createtest(data = iris, 
                   dependent = "Species",
                   problem = "classification",
                   method = "randomForest",
                   name = "An example classification test",
                   train_index = sample(150, 100)
                   )
runtest(test)

# A regression test
test <- createtest(data = iris,
                   dependent = "Sepal.Width",
                   problem = "regression",
                   method = "randomForest",
                   name = "An example regression test",
                   train_index = sample(150,100)
                   )
runtest(test)


## ------------------------------------------------------------------------
library(crtests)
library(randomForest)
library(rpart)
library(caret)
library(stringr)

# A classification multitest
summary(
  multitest(data = iris,
            dependent = "Species",
            problem = "classification",
            method = "randomForest",
            name = "An example classification multitest",
            iterations = 10,
            cross_validation = TRUE,
            preserve_distribution = TRUE
           )
)
# A regression multitest
summary(
  multitest(data = iris,
            dependent = "Sepal.Width",
            problem = "regression",
            method = "rpart",
            name = "An example regression multitest",
            iterations = 15,
            cross_validation = FALSE
           )
)

