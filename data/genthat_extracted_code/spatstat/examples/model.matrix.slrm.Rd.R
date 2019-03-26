library(spatstat)


### Name: model.matrix.slrm
### Title: Extract Design Matrix from Spatial Logistic Regression Model
### Aliases: model.matrix.slrm
### Keywords: spatial models

### ** Examples

   fit <- slrm(japanesepines ~x)
   head(model.matrix(fit))
   # matrix with two columns: '(Intercept)' and 'x'



