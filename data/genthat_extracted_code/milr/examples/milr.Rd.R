library(milr)


### Name: milr
### Title: Maximum likelihood estimation of multiple-instance logistic
###   regression with LASSO penalty
### Aliases: milr

### ** Examples

set.seed(100)
beta <- runif(5, -5, 5)
trainData <- DGP(70, 3, beta)
testData <- DGP(30, 3, beta)
# default (not use LASSO)
milr_result <- milr(trainData$Z, trainData$X, trainData$ID)
coef(milr_result)      # coefficients
fitted(milr_result)                    # fitted bag labels
fitted(milr_result, type = "instance") # fitted instance labels
summary(milr_result)   # summary milr
predict(milr_result, testData$X, testData$ID)                    # predicted bag labels
predict(milr_result, testData$X, testData$ID, type = "instance") # predicted instance labels

# use BIC to choose penalty
milr_result <- milr(trainData$Z, trainData$X, trainData$ID,
  exp(seq(log(0.01), log(50), length = 30)))
coef(milr_result)      # coefficients
fitted(milr_result)                    # fitted bag labels
fitted(milr_result, type = "instance") # fitted instance labels
summary(milr_result)   # summary milr
predict(milr_result, testData$X, testData$ID)                    # predicted bag labels
predict(milr_result, testData$X, testData$ID, type = "instance") # predicted instance labels

# use auto-tuning
milr_result <- milr(trainData$Z, trainData$X, trainData$ID, lambda = -1, numLambda = 20)
coef(milr_result)      # coefficients
fitted(milr_result)                    # fitted bag labels
fitted(milr_result, type = "instance") # fitted instance labels
summary(milr_result)   # summary milr
predict(milr_result, testData$X, testData$ID)                    # predicted bag labels
predict(milr_result, testData$X, testData$ID, type = "instance") # predicted instance labels

# use cv in auto-tuning
milr_result <- milr(trainData$Z, trainData$X, trainData$ID, 
                    lambda = -1, numLambda = 20, lambdaCriterion = "deviance")
coef(milr_result)      # coefficients
fitted(milr_result)                    # fitted bag labels
fitted(milr_result, type = "instance") # fitted instance labels
summary(milr_result)   # summary milr
predict(milr_result, testData$X, testData$ID)                    # predicted bag labels
predict(milr_result, testData$X, testData$ID, type = "instance") # predicted instance labels



