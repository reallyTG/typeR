library(subsemble)


### Name: subsemble
### Title: An Ensemble Method for Combining Subset-Specific Algorithm Fits
### Aliases: subsemble
### Keywords: models

### ** Examples

## Not run: 
##D # Load some example data.
##D 
##D library(cvAUC)
##D data(admissions)
##D 
##D # Training data.
##D x <- subset(admissions, select=-c(Y))[1:400,]
##D y <- admissions$Y[1:400]
##D 
##D # Test data.
##D newx <- subset(admissions, select=-c(Y))[401:500,]
##D newy <- admissions$Y[401:500]
##D 
##D 
##D # Set up the Subsemble.
##D 
##D learner <- c("SL.randomForest", "SL.glm")
##D metalearner <- c("SL.glm")
##D subsets <- 2
##D 
##D 
##D # Train and test the model.
##D # With learnControl$multiType="crossprod" (the default), 
##D # we ensemble 4 models (2 subsets x 2 learners).
##D 
##D fit <- subsemble(x=x, y=y, newx=newx, family=binomial(), 
##D                  learner = learner, metalearner = metalearner,
##D                  subsets = subsets)
##D 
##D 
##D # Evaulate the model by calculating AUC on the test set.
##D 
##D auc <- cvAUC(predictions=fit$pred, labels=newy)$cvAUC
##D print(auc)  # Test set AUC is: 0.937
##D 
##D 
##D # We can also use the predict method to generate predictions on new data afterwards.
##D 
##D pred <- predict(fit, newx)
##D auc <- cvAUC(predictions=pred$pred, labels=newy)$cvAUC
##D print(auc)  # Test set AUC is: 0.937
##D 
##D 
##D # Modify the learnControl argument and train/eval a new Subsemble.
##D # With learnControl$multiType="divisor", 
##D # we ensemble only 2 models (one for each subset).
##D 
##D fit <- subsemble(x=x, y=y, newx=newx, family=binomial(), 
##D                  learner = learner, metalearner = metalearner,
##D                  subsets = subsets,
##D                  learnControl = list(multiType="divisor"))
##D 
##D auc <- cvAUC(predictions=fit$pred, labels=newy)$cvAUC
##D print(auc)  # Test set AUC is: 0.922
##D 
##D 
##D # An example using a single learner.
##D # In this case there are 3 subsets and 1 learner,
##D # for a total of 3 models in the ensemble.
##D 
##D learner <- c("SL.randomForest")
##D metalearner <- c("SL.glmnet")
##D subsets <- 3
##D 
##D fit <- subsemble(x=x, y=y, newx=newx, family=binomial(),
##D                  learner = learner, metalearner = metalearner,
##D                  subsets = subsets)
##D                  
##D auc <- cvAUC(predictions=fit$pred, labels=newy)$cvAUC
##D print(auc)  # Test set AUC is: 0.925
##D 
##D 
##D # An example using the full data (i.e. subsets = 1).  
##D # Here, we have an ensemble of 2 models (one for each of the 2 learners).
##D # This is equivalent to the Super Learner algorithm.
##D 
##D learner <- c("SL.randomForest", "SL.glm")
##D metalearner <- c("SL.glm")
##D subsets <- 1
##D 
##D fit <- subsemble(x=x, y=y, newx=newx, family=binomial(), 
##D                  learner = learner, metalearner = metalearner,
##D                  subsets = subsets)
##D                  
##D auc <- cvAUC(predictions=fit$pred, labels=newY)$cvAUC
##D print(auc)  # Test set AUC is: 0.935
## End(Not run)



