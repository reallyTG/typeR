library(powerlmm)


### Name: get_var_ratio
### Title: Calculates the ratio of the slope variance to the
###   within-subjects error variance
### Aliases: get_var_ratio

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 3,
                          T_end = 10,
                          sigma_subject_intercept = 1.2,
                          sigma_subject_slope = 0.2,
                          sigma_cluster_intercept = 0,
                          sigma_cluster_slope = 0.2,
                          sigma_error = 1.2,
                          cohend = -0.8)

get_var_ratio(paras)



