library(randomGLM)


### Name: predict.randomGLM
### Title: Prediction from a random generalized linear model predictor
### Aliases: predict.randomGLM
### Keywords: misc

### ** Examples


## binary outcome prediction
# data generation
data(iris)
# Restrict data to first 100 observations
iris=iris[1:100,]
# Turn Species into a factor
iris$Species = as.factor(as.character(iris$Species))
# Select a training and a test subset of the 100 observations
set.seed(1)
indx = sample(100, 67, replace=FALSE)
xyTrain = iris[indx,]
xyTest = iris[-indx,]
xTrain = xyTrain[, -5]
yTrain = xyTrain[, 5]

xTest = xyTest[, -5]
yTest = xyTest[, 5]

# predict with a small number of bags - normally nBags should be at least 100.
RGLM = randomGLM(xTrain, yTrain, nCandidateCovariates=ncol(xTrain), nBags=30, keepModels = TRUE, nThreads = 1)
predicted = predict(RGLM, newdata = xTest, type="class")
table(predicted, yTest)

## continuous outcome prediction

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)

xTrain = x[1:50,]
yTrain = y[1:50]
xTest = x[51:100,]
yTest = y[51:100]

RGLM = randomGLM(xTrain, yTrain, classify=FALSE, nCandidateCovariates=ncol(xTrain), 
                 nBags=10, keepModels = TRUE, nThreads = 1)
predicted = predict(RGLM, newdata = xTest)



