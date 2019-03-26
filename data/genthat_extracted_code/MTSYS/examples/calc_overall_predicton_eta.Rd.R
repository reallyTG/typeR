library(MTSYS)


### Name: calc_overall_predicton_eta
### Title: Function to calculate overall prediction eta for the T method
### Aliases: calc_overall_predicton_eta

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

modified_eta_hat <- model$eta_hat
modified_eta_hat[3] <- 0

modified_M_hat <- calc_M_hat(model$X, model$beta_hat, modified_eta_hat)

(modified_overall_predicton_eta <-
                            calc_overall_predicton_eta(model$M,
                                                       modified_M_hat,
                                                       subtracts_V_e = TRUE))




