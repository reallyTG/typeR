library(modeltools)


### Name: Predict
### Title: Model Predictions
### Aliases: Predict
### Keywords: misc

### ** Examples


df <- data.frame(x = runif(10), y = rnorm(10))
mf <- dpp(linearModel, y ~ x, data = df)
Predict(fit(linearModel, mf))




