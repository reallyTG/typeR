library(milr)


### Name: softmax
### Title: Multiple-instance logistic regression via softmax function
### Aliases: softmax

### ** Examples

set.seed(100)
beta <- runif(10, -5, 5)
trainData <- DGP(70, 3, beta)
testData <- DGP(30, 3, beta)
# Fit softmax-MILR model S(0)
softmax_result <- softmax(trainData$Z, trainData$X, trainData$ID, alpha = 0)
coef(softmax_result)      # coefficients
fitted(softmax_result)                    # fitted bag labels
fitted(softmax_result, type = "instance") # fitted instance labels
predict(softmax_result, testData$X, testData$ID)                    # predicted bag labels
predict(softmax_result, testData$X, testData$ID, type = "instance") # predicted instance labels
# Fit softmax-MILR model S(3)
softmax_result <- softmax(trainData$Z, trainData$X, trainData$ID, alpha = 3)



