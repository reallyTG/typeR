library(rFerns)


### Name: rFerns
### Title: Classification with random ferns
### Aliases: rFerns rFerns.formula rFerns.matrix rFerns.default

### ** Examples

set.seed(77)
#Fetch Iris data
data(iris)
#Build model
rFerns(Species~.,data=iris)
##Importance
rFerns(Species~.,data=iris,importance="shadow")->model
print(model$imp)



