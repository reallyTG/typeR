library(MTSYS)


### Name: generates_model
### Title: Wrapper function to generate a model for a family of Taguchi (T)
###   methods
### Aliases: generates_model

### ** Examples

# The value of the dependent variable of the following samples mediates
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

# The following samples are data other than the unit space data and the test
# data.
stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

# The following test samples are chosen casually.
stackloss_test <- stackloss[c(2, 12, 19), -4]

# T1 method
model_T1 <- generates_model(unit_space_data = stackloss_center,
                            signal_space_data = stackloss_signal,
                            method = "T1",
                            subtracts_V_e = TRUE)

forecasting_T1 <- forecasting(model = model_T1,
                              newdata = stackloss_test)

(forecasting_T1$y_hat)

# Ta method
model_Ta <- generates_model(sample_data =
                                   rbind(stackloss_center, stackloss_signal),
                            method = "Ta",
                            subtracts_V_e = TRUE)

forecasting_Ta <- forecasting(model = model_Ta,
                              newdata = stackloss_test)

(forecasting_Ta$y_hat)

# Tb method
model_Tb <- generates_model(sample_data =
                                   rbind(stackloss_center, stackloss_signal),
                            method = "Tb",
                            subtracts_V_e = TRUE)

forecasting_Tb <- forecasting(model = model_Tb,
                              newdata = stackloss_test)

(forecasting_Tb$y_hat)




