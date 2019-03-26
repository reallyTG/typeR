library(powerlmm)


### Name: get_ICC_pre_subjects
### Title: Calculate the subject-level ICC at pretest
### Aliases: get_ICC_pre_subjects

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 3,
                          T_end = 10,
                          sigma_subject_intercept = 1.2,
                          sigma_subject_slope = 0.2,
                          sigma_cluster_intercept = 0.5,
                          sigma_cluster_slope = 0.2,
                          sigma_error = 1.2,
                          cohend = -0.8)

get_ICC_pre_subjects(paras)



