library(radiant.model)


### Name: predict.crtree
### Title: Predict method for the crtree function
### Aliases: predict.crtree

### ** Examples

result <- crtree(titanic, "survived", c("pclass", "sex"), lev = "Yes")
predict(result, pred_cmd = "pclass = levels(pclass)")
result <- crtree(titanic, "survived", "pclass", lev = "Yes")
predict(result, pred_data = titanic) %>% head()




