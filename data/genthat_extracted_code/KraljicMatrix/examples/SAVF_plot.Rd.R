library(KraljicMatrix)


### Name: SAVF_plot
### Title: Plot the single attribute value curve
### Aliases: SAVF_plot

### ** Examples


# Given the single attribute x is bounded between 1 and 5 and the subject matter experts
# prefer x values of 3, 4, & 5 provide a utility score of .75, .90 & 1.0 respectively,
# the preferred rho is 0.54. We can visualize this value function:

SAVF_plot(desired_x = c(3, 4, 5),
          desired_v = c(.75, .9, 1),
          x_low = 1,
          x_high = 5,
          rho = 0.54)




