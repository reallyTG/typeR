library(hypervolume)


### Name: hypervolume_svm
### Title: Hypervolume construction via one-class support vector machine
###   (SVM) learning model
### Aliases: hypervolume_svm

### ** Examples

data(iris)
hv = hypervolume_svm(data=subset(iris, Species=="setosa")[,1:2],name='setosa')
summary(hv)



