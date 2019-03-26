library(grplasso)


### Name: predict.grplasso
### Title: Predict Method for grplasso Objects
### Aliases: predict.grplasso
### Keywords: methods

### ** Examples

data(splice)

contr <- rep(list("contr.sum"), ncol(splice) - 1)
names(contr) <- names(splice)[-1]

fit <- grplasso(y ~ ., data = splice, model = LogReg(), lambda = 10,
                contrasts = contr, standardize = TRUE)

pred <- predict(fit)
pred.resp <- predict(fit, type = "response")

## The following points should lie on the sigmoid curve
plot(pred, pred.resp)



