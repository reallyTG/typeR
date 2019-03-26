library(powerlmm)


### Name: per_treatment
### Title: Setup parameters that differ per treatment group
### Aliases: per_treatment

### ** Examples

n2 <- per_treatment(control = 10,
                    treatment = 20)
p <- study_parameters(n1 = 11,
                      n2 = n2,
                      n3 = 6,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)



