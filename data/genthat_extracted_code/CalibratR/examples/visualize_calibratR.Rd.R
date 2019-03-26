library(CalibratR)


### Name: visualize_calibratR
### Title: visualize_calibratR
### Aliases: visualize_calibratR

### ** Examples

## Loading dataset in environment
 data(example)
 calibration_model <- example$calibration_model

 visualisation <- visualize_calibratR(calibration_model, plot_distributions=FALSE,
 rd_partitions=FALSE, training_set_calibrated=FALSE)



