library(itree)


### Name: residuals.itree
### Title: Residuals From a Fitted itree Object
### Aliases: residuals.itree
### Keywords: tree

### ** Examples

#the rpart example:
fit <- itree(skips ~ Opening + Solder + Mask + PadType + Panel,
       data=solder, method='anova')
summary(residuals(fit))
plot(predict(fit),residuals(fit))



