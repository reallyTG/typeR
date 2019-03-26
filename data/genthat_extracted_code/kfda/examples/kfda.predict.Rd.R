library(kfda)


### Name: kfda.predict
### Title: Predict Method for Kernel Fisher Discriminant Analysis (KFDA)
###   fit
### Aliases: kfda.predict
### Keywords: kfda

### ** Examples

# data input
data(iris)

# data separation
idx <- sample(1:dim(iris)[1], round(dim(iris)[1]*0.7))
trainData <- iris[idx, ]
testData <- iris[-(idx), -dim(iris)[2]]
testData.Label <- iris[-(idx), dim(iris)[2]]

# training KFDA model
kfda.model <- kfda(trainData = trainData, kernel.name = "rbfdot")

# testing new(test)data by KFDA model
pre <- kfda.predict(object = kfda.model, testData = testData)

# plotting
plot(kfda.model$LDs, col = kfda.model$label, pch = 19, main = "Plot for KFDA")
points(pre$x, col = pre$class, cex = 2)
legend("topleft", legend = c("trainData","testData"), pch = c(19,1))

# prediction result
table(pre$class, (testData.Label))




