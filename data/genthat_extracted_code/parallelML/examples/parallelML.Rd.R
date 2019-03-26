library(parallelML)


### Name: parallelML
### Title: Parallel-Voting version of machine learning algorithms
### Aliases: parallelML parallelML.default summary.parallelML
###   print.parallelML

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
##D subdata <- iris[1:60,]
##D 
##D # Create a model
##D parsvmmodel   <- parallelML("svm(formula = Species ~ ., data = subdata)",
##D                             "e1071",samplingSize = 0.8,
##D                             underSample = TRUE, underSampleTarget = "versicolor")
##D                             
##D # Get prediction                            
##D parsvmpred    <- predictML("predict(parsvmmodel,newdata=subdata)",
##D                            "e1071","vote")
##D                            
##D # Check the quality                           
##D table(parsvmpred,subdata$Species)
## End(Not run)
## Not run: 
##D # Load the library which provides svm
##D library(e1071)
##D 
##D # Create your data
##D data(iris)
##D 
##D # Create a model
##D parsvmmodel   <- parallelML("svm(formula = Species ~ ., data = iris)",
##D                             "e1071",samplingSize = 0.6,
##D                             sampleMethod = "random")
##D                             
##D # Get prediction                            
##D parsvmpred    <- predictML("predict(parsvmmodel,newdata=iris)",
##D                            "e1071","vote")
##D                            
##D # Check the quality                           
##D table(parsvmpred,iris$Species)
## End(Not run)



