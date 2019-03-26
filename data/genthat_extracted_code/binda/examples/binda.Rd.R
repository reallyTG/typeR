library(binda)


### Name: binda
### Title: Binary Discriminant Analysis: Model Fit and Class Prediction
### Aliases: binda predict.binda
### Keywords: multivariate

### ** Examples

# load "binda" library
library("binda")

# training data set with labels
Xtrain = matrix(c(1, 1, 0, 1, 0, 0,
             1, 1, 1, 1, 0, 0,
             1, 0, 0, 0, 1, 1,
             1, 0, 0, 0, 1, 1), nrow=4, byrow=TRUE)
colnames(Xtrain) = paste0("V", 1:ncol(Xtrain))
is.binaryMatrix(Xtrain) # TRUE
L = factor(c("Treatment", "Treatment", "Control", "Control") )

# learn predictor
binda.fit = binda(Xtrain, L)

# predict classes using new test data
Xtest = matrix(c(1, 1, 0, 1, 1, 1,
                 1, 0, 0, 0, 1, 1), nrow=2, byrow=TRUE)
colnames(Xtest) = paste0("V", 1:ncol(Xtest))

predict(binda.fit, Xtest)




