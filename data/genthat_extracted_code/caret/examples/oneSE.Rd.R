library(caret)


### Name: oneSE
### Title: Selecting tuning Parameters
### Aliases: oneSE best tolerance
### Keywords: manip

### ** Examples


## Not run: 
##D # simulate a PLS regression model
##D test <- data.frame(ncomp = 1:5,
##D                    RMSE = c(3, 1.1, 1.02, 1, 2),
##D                    RMSESD = .4)
##D 
##D best(test, "RMSE", maximize = FALSE)
##D oneSE(test, "RMSE", maximize = FALSE, num = 10)
##D tolerance(test, "RMSE", tol = 3, maximize = FALSE)
##D 
##D ### usage example
##D 
##D data(BloodBrain)
##D 
##D marsGrid <- data.frame(degree = 1, nprune = (1:10) * 3)
##D 
##D set.seed(1)
##D marsFit <- train(bbbDescr, logBBB,
##D                  method = "earth",
##D                  tuneGrid = marsGrid,
##D                  trControl = trainControl(method = "cv",
##D                                           number = 10,
##D                                           selectionFunction = "tolerance"))
##D 
##D # around 18 terms should yield the smallest CV RMSE
## End(Not run)





