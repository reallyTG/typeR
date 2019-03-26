library(qfasar)


### Name: est_diet
### Title: Estimate predator diet composition
### Aliases: est_diet

### ** Examples

est_diet(pred_sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                              0.04, 0.11, 0.29, 0.56,
                              0.10, 0.06, 0.35, 0.49,
                              0.05, 0.15, 0.35, 0.45), ncol=4),
         pred_uniq_types = c("Pred_1", "Pred_2"),
         pred_loc = matrix(c(1, 3, 2, 4), ncol=2),
         prey_sigs = matrix(c(0.06, 0.09, 0.31, 0.54,
                              0.05, 0.09, 0.30, 0.56,
                              0.03, 0.10, 0.30, 0.57,
                              0.08, 0.07, 0.30, 0.55,
                              0.09, 0.05, 0.33, 0.53,
                              0.09, 0.06, 0.34, 0.51,
                              0.09, 0.07, 0.34, 0.50,
                              0.08, 0.11, 0.35, 0.46,
                              0.06, 0.14, 0.36, 0.44), ncol=9),
         prey_uniq_types = c("Prey_1", "Prey_2", "Prey_3"),
         prey_loc = matrix(c(1, 4, 7, 3, 6, 9), ncol=2),
         cc = c(0.75, 1.00, 1.50, 1.15),
         space = 1, dist_meas = 1, ind_boot = 2,
         mean_meth = 0)




