library(MTSYS)


### Name: forecasting.Ta
### Title: Forecasting method for the Ta method
### Aliases: forecasting.Ta

### ** Examples

model_Ta <- Ta(sample_data = stackloss[-c(2, 12, 19), ],
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

forecasting_Ta <- forecasting(model = model_Ta,
                              newdata = stackloss[c(2, 12, 19), -4],
                              includes_transformed_newdata = TRUE)

(forecasting_Ta$y_hat) # Estimated values
(stackloss[c(2, 12, 19), 4]) # True values




