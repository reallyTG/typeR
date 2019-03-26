library(CalibratR)


### Name: predict_calibratR
### Title: predict_calibratR
### Aliases: predict_calibratR

### ** Examples

 ## Loading dataset in environment
 data(example)
 test_set <- example$test_set
 calibration_model <- example$calibration_model

 ## Predict for test set
predictions <-  predict_calibratR(calibration_model$calibration_models, new=test_set, nCores = 2)




