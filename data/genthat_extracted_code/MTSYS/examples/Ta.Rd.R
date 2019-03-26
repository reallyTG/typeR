library(MTSYS)


### Name: Ta
### Title: Function to generate a prediction expression for the Ta method
### Aliases: Ta

### ** Examples

model_Ta <- Ta(sample_data = stackloss[-c(2, 12, 19), ],
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

(model_Ta$M_hat)




