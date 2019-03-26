library(powerlmm)


### Name: get_DEFT
### Title: Calculate the design effect and Type I errors
### Aliases: get_DEFT get_DEFT.plcp_3lvl

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 30,
                          n3 = 3,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = c(0.01,0.05, 0.1),
                          var_ratio = 0.02)

get_DEFT(paras)



