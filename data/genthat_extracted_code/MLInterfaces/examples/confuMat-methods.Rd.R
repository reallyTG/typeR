library(MLInterfaces)


### Name: confuMat-methods
### Title: Compute the confusion matrix for a classifier.
### Aliases: confuMat confuMat-methods confuMat,classifierOutput-method
###   confuMat,classifierOutput,character-method
###   confuMat,classifierOutput,missing-method
###   confuMat,classifierOutput,numeric-method
### Keywords: methods classif

### ** Examples

library(golubEsets)
data(Golub_Merge)
smallG <- Golub_Merge[101:150,]
k1 <- MLearn(ALL.AML~., smallG, knnI(k=1), 1:30)
confuMat(k1)
confuMat(k1, "train")



