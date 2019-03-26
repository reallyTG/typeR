library(parallelSVM)


### Name: parallelSVM
### Title: Parallel-voting version of Support-Vector-Machine
### Aliases: parallelSVM parallelSVM.default parallelSVM.formula
###   summary.parallelSVM print.parallelSVM

### ** Examples

## Not run: 
##D # Load the normal svm function
##D library(e1071)
##D 
##D # Example with formula
##D # load trainData and testData
##D data(magicData)
##D 
##D # Calculate the model
##D # Here we use it on bigger data
##D system.time(serialSvm   <- svm(V11 ~ ., trainData[,-1], 
##D 						probability=TRUE, cost=10, gamma=0.1))
##D system.time(parallelSvm <- parallelSVM(V11 ~ ., data = trainData[,-1],
##D 						numberCores = 8, samplingSize = 0.2, 
##D 						probability = TRUE, gamma=0.1, cost = 10))
##D                                        
##D # Calculate predictions
##D system.time(serialPredictions <- predict(serialSvm, testData))
##D system.time(parallelPredicitions <- predict(parallelSvm, testData))
##D 
##D # Check for quality
##D table(serialPredictions,testData[,"V11"])
##D table(parallelPredicitions,testData[,"V11"])
##D 
##D # Example without formula
##D # load data
##D data(iris)
##D x <- subset(iris, select = -Species)
##D y <- iris$Species
##D 
##D # estimate model and predict input values
##D system.time(model       <- parallelSVM(x, y))
##D system.time(serialmodel <- svm(x, y))
##D 
##D fitted(model)
##D fitted(serialmodel)
##D 
##D # Calculate predictions
##D system.time(serialPredictions <- predict(serialmodel, x))
##D system.time(parallelPredicitions <- predict(model, x))
##D 
##D # Check for quality
##D table(serialPredictions,y)
##D table(parallelPredicitions,y)
## End(Not run)



