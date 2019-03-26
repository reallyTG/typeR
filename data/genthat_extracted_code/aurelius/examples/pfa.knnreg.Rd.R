library(aurelius)


### Name: pfa.knnreg
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.knnreg

### ** Examples

model <- caret::knnreg(mpg ~ cyl + hp + am + gear + carb, data = mtcars)
model_as_pfa <- pfa(model)



