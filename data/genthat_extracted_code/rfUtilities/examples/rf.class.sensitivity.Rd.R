library(rfUtilities)


### Name: rf.class.sensitivity
### Title: Random Forests class-level sensitivity analysis
### Aliases: rf.class.sensitivity

### ** Examples

library(randomForest)	
data(iris)
  y <- as.factor(ifelse(iris$Species == "setosa" | 
                 iris$Species == "virginica", 1, 0) )
    xdata <- iris[,1:4] 

rf.mdl <- randomForest(xdata, y, ntree=501) 
  ua <- rf.class.sensitivity(rf.mdl, xdata=xdata, nperm=20, ntree=501, plot=TRUE)
      



