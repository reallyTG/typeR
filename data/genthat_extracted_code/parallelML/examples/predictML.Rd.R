library(parallelML)


### Name: predictML
### Title: Parallel-Voting prediction of multiple machine learning models
### Aliases: predictML

### ** Examples

## Not run: 
##D # Load the library which provides svm
##D library(e1071)
##D 
##D # Create your data
##D data(iris)
##D 
##D # Create a model
##D parSvmModel <- parallelML("svm(formula = Species ~ ., data = iris)",
##D                      "e1071",samplingSize = 0.8)
##D                      
##D # Get prediction
##D parSvmPred   <- predictML("predict(parSvmModel,newdata=iris)",
##D                           "e1071","vote")
##D 
##D # Check the quality
##D table(parSvmPred,iris$Species)
## End(Not run)
## Not run: 
##D # Load the library which provides rpart
##D library(rpart)
##D 
##D # Create your data
##D data("magicData")
##D 
##D # Create a model
##D parTreeModel  <- parallelML("rpart(formula = V11 ~ ., data = trainData[,-1])",
##D                             "rpart",samplingSize = 0.8)
##D 
##D # Get prediction
##D parTrainTreePred  <- predictML("predict(parTreeModel,newdata=trainData[,-1],type='class')",
##D                                "rpart","vote")
##D parTestTreePred  <- predictML("predict(parTreeModel,newdata=testData[,-1],type='class')",
##D                               "rpart","vote")
##D 
##D # Check the quality
##D table(parTrainTreePred,trainData$V11)
##D table(parTestTreePred,testData$V11)	
## End(Not run)
## Not run: 
##D # Load the library which provides svm
##D library(e1071)
##D 
##D # Create your data
##D data(iris)
##D data("magicData")
##D 
##D # Get nummeric predicitions of Support Vector Machine
##D parsvmmodel   <- parallelML("svm(formula = Species ~ ., data = iris,probability=TRUE)",
##D                             "e1071",samplingSize = 0.8,
##D                             underSample = TRUE, underSampleTarget = "versicolor")
##D parsvmpred    <- predictML("predict(parsvmmodel,newdata=iris,probability=TRUE)",
##D                            "e1071","avg")
##D 
##D # Get numeric predictions of a generalized linear model
##D parglmmodel   <- parallelML("glm(formula = V11 ~ ., data = trainData[,-1], 
##D                                  family = binomial(link='logit'))","stats",samplingSize = 0.8)
##D 
##D parglmpred   <- predictML("predict(parglmmodel,newdata=trainData[,-1],type='response')",
##D                           "stats","avg")
## End(Not run)



