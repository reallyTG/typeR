library(MVLM)


### Name: predict.mvlm
### Title: mvlm Model Predictions
### Aliases: predict.mvlm

### ** Examples

data(mvlmdata)
Y.train <- as.matrix(Y.mvlm[1:150,])
X.train <- X.mvlm[1:150,]

mvlm.res <- mvlm(Y.train ~ ., data = X.train)

X.test <- X.mvlm[151:200,]
Y.predict <- predict(mvlm.res, newdata = X.test)




