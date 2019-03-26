library(bayesCT)


### Name: binomialBACT
### Title: Binomial counts for Bayesian Adaptive Trials
### Aliases: binomialBACT

### ** Examples

binomialBACT(p_control = 0.12, p_treatment = 0.10,
             y0_treatment = 8, N0_treatment = 90,
             y0_control = 13, N0_control = 95,
             N_total = 300, N_impute = 100,
             lambda = c(0.3, 1), lambda_time = c(25),
             interim_look = c(210, 240, 270),
             EndofStudy = 50)




