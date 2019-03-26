library(SwarmSVM)


### Name: alphasvm
### Title: Support Vector Machines taking initial alpha values
### Aliases: alphasvm alphasvm.formula alphasvm.default print.alphasvm
###   summary.alphasvm print.summary.alphasvm

### ** Examples


data(svmguide1)
svmguide1.t = svmguide1[[2]]
svmguide1 = svmguide1[[1]]

model = alphasvm(x = svmguide1[,-1], y = svmguide1[,1], scale = TRUE)
preds = predict(model, svmguide1.t[,-1])
table(preds, svmguide1.t[,1])

data(iris)
attach(iris)

# default with factor response:
model = alphasvm(Species ~ ., data = iris)

# get new alpha
new.alpha = matrix(0, nrow(iris),2)
new.alpha[model$index,] = model$coefs

model2 = alphasvm(Species ~ ., data = iris, alpha = new.alpha)
preds = predict(model2, as.matrix(iris[,-5]))
table(preds, iris[,5])




