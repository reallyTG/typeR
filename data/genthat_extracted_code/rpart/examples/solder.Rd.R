library(rpart)


### Name: solder
### Title: Soldering of Components on Printed-Circuit Boards
### Aliases: solder
### Keywords: datasets

### ** Examples

fit <- rpart(skips ~ Opening + Solder + Mask + PadType + Panel,
             data = solder, method = "anova")
summary(residuals(fit))
plot(predict(fit), residuals(fit))



