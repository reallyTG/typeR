library(rotationForest)


### Name: predict.rotationForest
### Title: Predict method for rotationForest objects
### Aliases: predict.rotationForest
### Keywords: classification

### ** Examples

data(iris)
y <- as.factor(ifelse(iris$Species[1:100]=="setosa",0,1))
x <- iris[1:100,-5]
rF <- rotationForest(x,y)
predict(object=rF,newdata=x)



