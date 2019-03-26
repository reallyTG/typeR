library(MTSYS)


### Name: T1
### Title: Function to generate a prediction expression for the two-sided
###   Taguchi (T1) method
### Aliases: T1

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

(model_T1$M_hat)




