library(MTSYS)


### Name: forecasting.Tb
### Title: Forecasting method for the Tb method
### Aliases: forecasting.Tb

### ** Examples

model_Tb <- Tb(sample_data = stackloss[-c(2, 12, 19), ],
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

forecasting_Tb <- forecasting(model = model_Tb,
                              newdata = stackloss[c(2, 12, 19), -4],
                              includes_transformed_newdata = TRUE)

(forecasting_Tb$y_hat) # Estimated values
(stackloss[c(2, 12, 19), 4]) # True values




