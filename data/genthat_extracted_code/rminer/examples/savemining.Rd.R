library(rminer)


### Name: savemining
### Title: Load/save into a file the result of a fit (model) or mining
###   functions.
### Aliases: savemining savemodel loadmining loadmodel
### Keywords: file classif regression neural nonlinear

### ** Examples

data(iris)
M=fit(Species~.,iris,model="rpart")
savemodel(M,"iris.model") # saves to file
M=NULL # cleans M
M=loadmodel("iris.model") # load from file
print(M)



