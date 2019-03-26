library(rucm)


### Name: predict.ucm
### Title: Unobserved Components Model Predictions
### Aliases: predict.ucm

### ** Examples

modelNile <- ucm(Nile~0, data = Nile, slope = TRUE)
predict(modelNile$model, n.ahead = 12)




