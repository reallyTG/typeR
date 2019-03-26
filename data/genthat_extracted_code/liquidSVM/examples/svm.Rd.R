library(liquidSVM)


### Name: svm
### Title: Convenience function to initialize, train, select, and
###   optionally test an SVM.
### Aliases: svm

### ** Examples

# since Species is a factor the following performs multiclass classification
modelIris <- svm(Species ~ ., iris)
# equivalently
modelIris <- svm(iris[,1:4], iris$Species)

# since Height is numeric the following performs least-squares regression
modelTrees <- svm(Height ~ Girth + Volume, trees)
# equivalently
modelTrees <- svm(trees[,c(1,3)],trees$Height)



