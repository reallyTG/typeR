library(MLmetrics)


### Name: ConfusionDF
### Title: Confusion Matrix (Data Frame Format)
### Aliases: ConfusionDF
### Keywords: internal

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
ConfusionDF(y_pred = pred, y_true = mtcars$vs)



