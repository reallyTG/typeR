library(crtests)


### Name: runtest
### Title: Run a classification or regression test
### Aliases: runtest runtest.default

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
## Not run: 
##D # Run the test
##D runtest(test)
## End(Not run)



