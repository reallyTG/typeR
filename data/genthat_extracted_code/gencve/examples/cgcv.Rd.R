library(gencve)


### Name: cgcv
### Title: Estimate Misclassification Rate Using d-fold Cross-Validation
###   for Class Prediction
### Aliases: cgcv
### Keywords: models classif

### ** Examples

Xy <- rmix(200) #training data
X <- as.matrix.data.frame(Xy[,1:2])
y <- Xy[,3]
cgcv(X, y, MaxIter=50)



