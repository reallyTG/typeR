library(KraljicMatrix)


### Name: SAVF_plot_rho_error
### Title: Plot the rho squared error terms
### Aliases: SAVF_plot_rho_error

### ** Examples


# Given the single attribute x is bounded between 1 and 5 and the subject matter experts
# prefer x values of 3, 4, & 5 provide a utility score of .75, .90 & 1.0 respectively, we
# can visualize the error terms for rho values between 0-1:

SAVF_plot_rho_error(desired_x = c(3, 4, 5),
                    desired_v = c(.75, .9, 1),
                    x_low = 1,
                    x_high = 5,
                    rho_low = 0,
                    rho_high = 1)




