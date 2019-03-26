library(crtests)


### Name: summary.evaluation
### Title: Summary of an evaluation
### Aliases: summary.evaluation

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
##D # Run the test. The result is an object of class "evaluation"
##D evaluation <- runtest(test) 
##D summary(results)
## End(Not run)



