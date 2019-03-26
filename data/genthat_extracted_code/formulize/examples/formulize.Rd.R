library(formulize)


### Name: formulize
### Title: Create a formula/recipe interface to a modelling method
### Aliases: formulize

### ** Examples


library(glmnet)

glmnet_form <- formulize(cv.glmnet)

model <- glmnet_form(mpg ~ drat * hp - 1, mtcars)
predict(model, head(mtcars))




