library(rfUtilities)


### Name: rf.modelSel
### Title: Random Forest Model Selection
### Aliases: rf.modelSel

### ** Examples

# Classification on iris data
require(randomForest)
data(iris)
  iris$Species <- as.factor(iris$Species)
( rf.class <- rf.modelSel(iris[,1:4], iris[,"Species"], seed=1234, imp.scale="mir") )
( rf.class <- rf.modelSel(iris[,1:4], iris[,"Species"], seed=1234, imp.scale="mir", 
                          parsimony=0.03) )

   plot(rf.class)              # plot importance for selected variables
   plot(rf.class, imp = "all") # plot importance for all variables 

 vars <- rf.class$selvars
 ( rf.fit <- randomForest(x=iris[,vars], y=iris[,"Species"]) )

# Regression on airquality data
data(airquality)
  airquality <- na.omit(airquality)
( rf.regress <- rf.modelSel(airquality[,2:6], airquality[,1], imp.scale="se") )
( rf.regress <- rf.modelSel(airquality[,2:6], airquality[,1], imp.scale="se", parsimony=0.03) )

   plot(rf.regress)              # plot importance for selected variables
   plot(rf.regress, imp = "all") # plot importance for all variables 

# To use parameters from competing model
vars <- rf.regress$parameters[[3]]

# To use parameters from selected model
vars <- rf.regress$selvars 

( rf.fit <- randomForest(x=airquality[,vars], y=airquality[,1]) )




