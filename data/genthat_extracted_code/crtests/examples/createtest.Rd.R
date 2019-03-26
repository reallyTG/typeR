library(crtests)


### Name: createtest
### Title: Create a classification or regression test case
### Aliases: createtest

### ** Examples

data(iris)
# A classification test
test <- createtest(data = iris, 
                  dependent = "Species",
                  problem = "classification",
                  method = "randomForest",
                  name = "An example classification test",
                  train_index = sample(150, 100)
)

# A regression test
test <- createtest(data = iris, 
                  dependent = "Sepal.Width",
                  problem = "regression",
                  method = "randomForest",
                  name = "An example regression test",
                  train_index = sample(150, 100)
)




