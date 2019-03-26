library(qpcR)


### Name: predict.pcrfit
### Title: Value prediction from a fitted qPCR model
### Aliases: predict.pcrfit
### Keywords: models nonlinear

### ** Examples

m1 <- pcrfit(reps, 1, 2, l5)

## Which raw fluorescence value at cycle number = 17?
predict(m1, newdata = data.frame(Cycles = 17))

## Cycle numbers 20:25, with 95% confidence?
predict(m1, newdata = data.frame(Cycles = 20:25), interval = "confidence")

## Which cycle at Fluo = 4, with 95% prediction?
predict(m1, newdata = data.frame(Fluo = 4), which = "x", interval = "prediction")



