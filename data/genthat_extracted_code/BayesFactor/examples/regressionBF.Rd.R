library(BayesFactor)


### Name: regressionBF
### Title: Function to compute Bayes factors for regression designs
### Aliases: regressionBF
### Keywords: htest

### ** Examples

## See help(attitude) for details about the data set
data(attitude)

## Classical regression
summary(fm1 <- lm(rating ~ ., data = attitude))

## Compute Bayes factors for all regression models
output = regressionBF(rating ~ ., data = attitude, progress=FALSE)
head(output)
## Best model is 'complaints' only

## Compute all Bayes factors against the full model, and
## look again at best models
head(output / output[63])




