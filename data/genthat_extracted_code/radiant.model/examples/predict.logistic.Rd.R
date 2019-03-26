library(radiant.model)


### Name: predict.logistic
### Title: Predict method for the logistic function
### Aliases: predict.logistic

### ** Examples

result <- logistic(titanic, "survived", c("pclass", "sex"), lev = "Yes")
  predict(result, pred_cmd = "pclass = levels(pclass)")
logistic(titanic, "survived", c("pclass", "sex"), lev = "Yes") %>%
  predict(pred_cmd = "sex = c('male','female')")
logistic(titanic, "survived", c("pclass", "sex"), lev = "Yes") %>%
  predict(pred_data = titanic)




