library(qfasar)


### Name: gof
### Title: Goodness-of-fit for modeled predator signatures
### Aliases: gof

### ** Examples

gof(prey_sigs = matrix(c(0.06, 0.09, 0.31, 0.54,
                         0.05, 0.09, 0.30, 0.56,
                         0.03, 0.10, 0.30, 0.57,
                         0.08, 0.07, 0.30, 0.55,
                         0.09, 0.05, 0.33, 0.53,
                         0.09, 0.06, 0.34, 0.51,
                         0.09, 0.07, 0.34, 0.50,
                         0.08, 0.11, 0.35, 0.46,
                         0.06, 0.14, 0.36, 0.44), ncol = 9),
    prey_loc = matrix(c(1, 4, 7, 3, 6, 9), ncol=2),
    mean_sigs = matrix(c(0.047, 0.093, 0.303, 0.557,
                         0.087, 0.050, 0.323, 0.530,
                         0.077, 0.106, 0.350, 0.467), ncol = 3),
    diet_est = matrix(c(0.394, 0.356, 0.250,
                        0.336, 0.365, 0.299), ncol = 2),
    conv = c(TRUE, TRUE),
    obj_func = c(1.13, 2.24),
    dist_meas = 1,
    boot_gof = 10)





