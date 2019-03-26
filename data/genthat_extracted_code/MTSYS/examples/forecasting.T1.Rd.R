library(MTSYS)


### Name: forecasting.T1
### Title: Forecasting method for the T1 method
### Aliases: forecasting.T1

### ** Examples

# The value of the dependent variable of the following samples mediates
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

# The following samples are data other than the unit space data and the test
# data.
stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

model_T1 <- T1(unit_space_data = stackloss_center,
               signal_space_data = stackloss_signal,
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

# The following test samples are chosen casually.
stackloss_test <- stackloss[c(2, 12, 19), -4]

forecasting_T1 <- forecasting(model = model_T1,
                              newdata = stackloss_test,
                              includes_transformed_newdata = TRUE)

(forecasting_T1$y_hat) # Estimated values
(stackloss[c(2, 12, 19), 4]) # True values




