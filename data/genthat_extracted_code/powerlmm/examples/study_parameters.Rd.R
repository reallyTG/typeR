library(powerlmm)


### Name: study_parameters
### Title: Setup study parameters
### Aliases: study_parameters

### ** Examples

# Three level model with both subject- and cluster-level random slope
# Power calculation using standardized inputs
p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 4,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      effect_size = cohend(-0.8))

get_power(p)

# The same calculation with all parameters specified directly
p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 4,
                      T_end = 10,
                      fixed_intercept = 37,
                      fixed_slope = -0.65,
                      sigma_subject_intercept = 2.8,
                      sigma_subject_slope = 0.4726944,
                      sigma_cluster_intercept = 0,
                      sigma_cluster_slope = 0.1084435,
                      sigma_error = 2.8,
                      cor_subject = -0.5,
                      cor_cluster = 0,
                      effect_size = cohend(-0.8))
get_power(p)

# Standardized and unstandardized inputs
p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 4,
                      sigma_subject_intercept = 2.8,
                      icc_pre_cluster = 0.07,
                      sigma_subject_slope = 0.47,
                      icc_slope = 0.05,
                      sigma_error = 2.8,
                      effect_size = cohend(-0.8))

get_power(p)

## Two-level model with subject-level random slope
p <- study_parameters(n1 = 11,
                      n2 = 40,
                      icc_pre_subject = 0.5,
                      var_ratio = 0.03,
                      effect_size = cohend(-0.8))
get_power(p)

# add missing data
p <- update(p, dropout = dropout_weibull(0.2, 1))
get_power(p)

## Comparing a combination of values
p <- study_parameters(n1 = 11,
                      n2 = c(5, 10),
                      n3 = c(2, 4),
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = c(0, 0.05),
                      effect_size = cohend(c(-0.5, -0.8))
                      )

get_power(p)



