library(CountsEPPM)


### Name: predict.CountsEPPM
### Title: Prediction Method for CountsEPPM Objects
### Aliases: predict.CountsEPPM
### Keywords: methods distribution

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
predict(output.fn, type = "response")
predict(output.fn, type = "linear.predictor.mean")



