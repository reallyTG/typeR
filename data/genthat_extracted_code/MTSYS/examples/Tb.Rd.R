library(MTSYS)


### Name: Tb
### Title: Function to generate a prediction expression for the Tb method
### Aliases: Tb

### ** Examples

model_Tb <- Tb(sample_data = stackloss[-c(2, 12, 19), ],
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

(model_Tb$M_hat)




