library(edarf)


### Name: plot_pred
### Title: Plot predicted versus observed values
### Aliases: plot_pred

### ** Examples

library(randomForest)
library(edarf)
fit = randomForest(hp ~ ., mtcars)
pred = predict(fit, newdata = mtcars)
plot_pred(pred, mtcars$hp,
  outlier_idx = which(abs(pred - mtcars$hp) > .5 * sd(mtcars$hp)),
  labs = row.names(mtcars))



