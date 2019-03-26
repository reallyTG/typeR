library(BinaryEPPM)


### Name: predict.BinaryEPPM
### Title: Prediction Method for BinaryEPPM Objects
### Aliases: predict.BinaryEPPM
### Keywords: methods distribution

### ** Examples

data("ropespores.case")
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')                 
predict(output.fn, type = "response")
predict(output.fn, type = "linear.predictor.p")



