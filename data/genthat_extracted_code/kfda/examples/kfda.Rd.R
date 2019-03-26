library(kfda)


### Name: kfda
### Title: Kernel Fisher Discriminant Analysis (KFDA)
### Aliases: kfda
### Keywords: kfda

### ** Examples

# data input
data(iris)

# data separation
idx <- sample(1:dim(iris)[1], round(dim(iris)[1]*0.7))
trainData <- iris[idx, ]

# training KFDA model
kfda.model <- kfda(trainData = trainData, kernel.name = "rbfdot")

# structure of kfda.model
str(kfda.model)



