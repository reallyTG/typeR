library(powerlmm)


### Name: get_sds
### Title: Calculate the model implied standard deviations per time point
### Aliases: get_sds

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 6,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = 0.05,
                          var_ratio = 0.03)

get_sds(paras)

# plot
plot(get_sds(paras))




