library(randomUniformForest)


### Name: init_values
### Title: Training and validation samples from data
### Aliases: init_values

### ** Examples

data(iris)
Y <- iris$Species
X <- iris[,-which(colnames(iris) == "Species")]
trainingAndValidationsamples <- init_values(X, Y, sample.size = 0.5)

Xtrain = trainingAndValidationsamples$xtrain
Ytrain = trainingAndValidationsamples$ytrain
Xvalid = trainingAndValidationsamples$xtest
Yvalid = trainingAndValidationsamples$ytest



