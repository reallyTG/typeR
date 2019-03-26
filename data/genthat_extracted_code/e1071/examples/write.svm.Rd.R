library(e1071)


### Name: write.svm
### Title: Write SVM Object to File
### Aliases: write.svm
### Keywords: neural nonlinear classif

### ** Examples

data(iris)
attach(iris)

## classification mode
# default with factor response:
model <- svm (Species~., data=iris)

# export SVM object to file
write.svm(model, svm.file = "iris-classifier.svm", scale.file = "iris-classifier.scale")

# read scale file
# the n-th row is corresponding to n-th dimension. The 1st column contains the
# center value, the 2nd column is the scale value.

read.table("iris-classifier.scale")




