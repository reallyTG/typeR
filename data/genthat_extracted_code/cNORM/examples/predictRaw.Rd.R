library(cNORM)


### Name: predictRaw
### Title: Predict single raw value
### Aliases: predictRaw

### ** Examples

# Prediction of single scores
normData <- prepareData()
m <- bestModel(data = normData)
predictRaw(35, 3.5, m$coefficients)

# Fitting complete data sets
fitted.values <- predict(m)

# break up contribution of each predictor variable
fitted.partial <- predict(m, type = "terms")



