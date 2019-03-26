library(CalibratR)


### Name: calibrate
### Title: calibrate
### Aliases: calibrate

### ** Examples

 ## Loading dataset in environment
 data(example)
 actual <- example$actual
 predicted <- example$predicted

 ## Create calibration models
 calibration_model <- calibrate(actual, predicted,
                              model_idx = c(1,2),
                              FALSE, FALSE, folds = 10, n_seeds = 1, nCores = 2)



