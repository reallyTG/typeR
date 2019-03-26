library(qfasar)


### Name: adj_diet_fat
### Title: Adjust diet composition estimates for prey fat content
### Aliases: adj_diet_fat

### ** Examples

adj_diet_fat(prey_fat = c(0.5, 1, 2),
             diet_est = c(0.3, 0.2, 0.5),
             diet_var = matrix(c( 0.030,  0.004, -0.003,
                                 0.004,  0.025, -0.007,
                                -0.003, -0.007,  0.045),
                               nrow = 3, ncol = 3))

adj_diet_fat(prey_fat = c(0.5, 1, 2),
             diet_est = c(0.3, 0.2, 0.5))




