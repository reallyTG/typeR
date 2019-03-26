library(qfasar)


### Name: diet_pool
### Title: Pool diet estimates to combined prey types
### Aliases: diet_pool

### ** Examples

diet_pool(rep_grp = matrix(c(1, 0, 0, 0, 0, 0, 0,
                             0, 1, 0, 0, 0, 0, 0,
                             0, 1, 0, 0, 0, 0, 0,
                             0, 0, 1, 0, 0, 0, 0,
                             0, 0, 0, 1, 0, 0, 0,
                             0, 0, 0, 1, 0, 0, 0,
                             0, 0, 0, 0, 1, 0, 0,
                             0, 0, 0, 0, 0, 1, 0,
                             0, 0, 0, 0, 0, 1, 0,
                             0, 0, 0, 0, 0, 0, 1),
                           nrow = 10, byrow = TRUE),
         est_ind = matrix(c(0.116, 0.315,
                            0.028, 0.073,
                            0.000, 0.000,
                            0.131, 0.120,
                            0.000, 0.000,
                            0.000, 0.000,
                            0.723, 0.452,
                            0.000, 0.000,
                            0.000, 0.000,
                            0.002, 0.040),
                          nrow = 10, byrow = TRUE))





