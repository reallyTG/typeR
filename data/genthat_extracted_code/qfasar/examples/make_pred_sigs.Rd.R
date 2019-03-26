library(qfasar)


### Name: make_pred_sigs
### Title: Simulate predator signatures
### Aliases: make_pred_sigs

### ** Examples

make_pred_sigs(prey_sigs = matrix(c(0.06, 0.09, 0.31, 0.54,
                                  0.05, 0.09, 0.30, 0.56,
                                  0.03, 0.10, 0.30, 0.57,
                                  0.08, 0.07, 0.30, 0.55,
                                  0.09, 0.05, 0.33, 0.53,
                                  0.09, 0.06, 0.34, 0.51,
                                  0.09, 0.07, 0.34, 0.50,
                                  0.08, 0.11, 0.35, 0.46,
                                  0.06, 0.14, 0.36, 0.44), ncol = 9),
               prey_loc = matrix(c(1, 4, 7, 3, 6, 9), ncol=2),
               cc = c(0.75, 1.05, 0.55, 1.75),
               diet = c(0.25, 0.25, 0.50),
               prey_ss = c(5, 3, 7),
               n_pred = 50)




