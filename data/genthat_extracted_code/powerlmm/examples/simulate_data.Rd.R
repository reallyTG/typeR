library(powerlmm)


### Name: simulate_data
### Title: Generate a data set using a 'study_parameters'-object
### Aliases: simulate_data simulate_data.plcp simulate_data.plcp_multi

### ** Examples

p <- study_parameters(n1 = 11,
                      n2 = 10,
                      n3 = 4,
                      T_end = 10,
                      fixed_intercept = 37,
                      fixed_slope = -0.65,
                      sigma_subject_intercept = 2.89,
                      sigma_cluster_intercept = 0.6,
                      icc_slope = 0.1,
                      var_ratio = 0.03,
                      sigma_error = 1.5,
                      cor_subject = -0.5,
                      cor_cluster = 0,
                      cohend = 0.5)

d <- simulate_data(p)



