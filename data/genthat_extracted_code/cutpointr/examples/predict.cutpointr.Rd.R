library(cutpointr)


### Name: predict.cutpointr
### Title: Predict using a cutpointr object
### Aliases: predict.cutpointr

### ** Examples

oc <- cutpointr(suicide, dsi, suicide)
## Return in-sample predictions
predict(oc, newdata = data.frame(dsi = oc$data[[1]]$dsi))



