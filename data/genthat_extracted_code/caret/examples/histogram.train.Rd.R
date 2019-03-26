library(caret)


### Name: histogram.train
### Title: Lattice functions for plotting resampling results
### Aliases: histogram.train stripplot.train xyplot.train densityplot.train
### Keywords: hplot

### ** Examples


## Not run: 
##D 
##D library(mlbench)
##D data(BostonHousing)
##D 
##D library(rpart)
##D rpartFit <- train(medv ~ .,
##D                   data = BostonHousing,
##D                   "rpart", 
##D                   tuneLength = 9,
##D                   trControl = trainControl(
##D                     method = "boot", 
##D                     returnResamp = "all"))
##D 
##D densityplot(rpartFit,
##D             adjust = 1.25)
##D 
##D xyplot(rpartFit,
##D        metric = "Rsquared",
##D        type = c("p", "a"))
##D 
##D stripplot(rpartFit,
##D           horizontal = FALSE,
##D           jitter = TRUE)
##D 
## End(Not run)



