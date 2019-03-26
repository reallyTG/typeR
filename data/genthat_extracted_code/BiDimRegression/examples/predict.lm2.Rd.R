library(BiDimRegression)


### Name: predict.lm2
### Title: Predict method for Bidimensional Regression Model Fits
### Aliases: predict.lm2

### ** Examples

lm2euc <- lm2(depV1+depV2~indepV1+indepV2, NakayaData, transformation = 'Euclidean')
predict(lm2euc, NakayaData[, 3:4])



