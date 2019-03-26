library(rpart)


### Name: residuals.rpart
### Title: Residuals From a Fitted Rpart Object
### Aliases: residuals.rpart
### Keywords: tree

### ** Examples

fit <- rpart(skips ~ Opening + Solder + Mask + PadType + Panel,
             data = solder, method = "anova")
summary(residuals(fit))
plot(predict(fit),residuals(fit))



