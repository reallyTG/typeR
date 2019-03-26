library(MTSYS)


### Name: general_T
### Title: General function to generate a prediction expression for a
###   family of Taguchi (T) methods
### Aliases: general_T

### ** Examples

# The value of the dependent variable of the following samples mediates
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

# The following samples are data other than the unit space data and the test
# data.
stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

# The following settings are same as the T1 method.
model <- general_T(unit_space_data = stackloss_center,
                   signal_space_data = stackloss_signal,
                   generates_transform_functions =
                                       generates_transformation_functions_T1,
                   subtracts_V_e = TRUE,
                   includes_transformed_data = TRUE)

(model$M_hat)




