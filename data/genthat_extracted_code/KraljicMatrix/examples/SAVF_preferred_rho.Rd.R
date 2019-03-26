library(KraljicMatrix)


### Name: SAVF_preferred_rho
### Title: Identify preferred rho
### Aliases: SAVF_preferred_rho

### ** Examples


# Given the single attribute x is bounded between 1 and 5 and the subject matter experts
# prefer x values of 3, 4, & 5 provide a utility score of .75, .90 & 1.0 respectively, we
# can search for a rho value between 0-1 that provides the best fit utility function:

SAVF_preferred_rho(desired_x = c(3, 4, 5),
                   desired_v = c(.75, .9, 1),
                   x_low = 1,
                   x_high = 5,
                   rho_low = 0,
                   rho_high = 1)




