library(powerlmm)


### Name: get_correlation_matrix
### Title: Calculate the subject-level (ICC) correlations among time points
### Aliases: get_correlation_matrix get_correlation_matrix.plcp_multi

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 3,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = 0.05,
                          var_ratio = 0.03)
get_correlation_matrix(paras)



