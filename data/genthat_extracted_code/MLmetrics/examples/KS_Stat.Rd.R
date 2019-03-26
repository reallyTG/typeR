library(MLmetrics)


### Name: KS_Stat
### Title: Kolmogorov-Smirnov Statistic
### Aliases: KS_Stat

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
KS_Stat(y_pred = logreg$fitted.values, y_true = mtcars$vs)



