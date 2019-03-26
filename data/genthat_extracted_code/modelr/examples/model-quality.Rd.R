library(modelr)


### Name: model-quality
### Title: Compute model quality for a given dataset
### Aliases: model-quality mse rmse mae rsquare qae mape rsae

### ** Examples

mod <- lm(mpg ~ wt, data = mtcars)
mse(mod, mtcars)
rmse(mod, mtcars)
rsquare(mod, mtcars)
mae(mod, mtcars)
qae(mod, mtcars)
mape(mod, mtcars)
rsae(mod, mtcars)



