library(interpretR)


### Name: variableImportance
### Title: Permutation- based Variable Importance Measures
### Aliases: variableImportance

### ** Examples

#Prepare data
data(iris)
iris <- iris[1:100,]
iris$Species <- as.factor(ifelse(factor(iris$Species)=="setosa",0,1))
#Estimate model
library(randomForest)
ind <- sample(nrow(iris),50)
rf <- randomForest(Species~., iris[ind,])
#Obtain variable importances
variableImportance(object=rf, xdata=iris[-ind,names(iris) != "Species"],
ydata=iris[-ind,]$Species)



