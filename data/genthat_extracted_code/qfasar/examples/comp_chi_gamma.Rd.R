library(qfasar)


### Name: comp_chi_gamma
### Title: Compute gamma parameter of chi-square distance measure
### Aliases: comp_chi_gamma

### ** Examples

comp_chi_gamma(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                               0.04, 0.11, 0.29, 0.56,
                               0.10, 0.05, 0.35, 0.50,
                               0.12, 0.03, 0.37, 0.48,
                               0.10, 0.06, 0.35, 0.49,
                               0.05, 0.15, 0.35, 0.45), ncol=6),
               cc = c(0.75, 1.00, 1.50, 0.90),
               near_zero = 0.05,
               min_gamma = 0.01,
               space = 1)




