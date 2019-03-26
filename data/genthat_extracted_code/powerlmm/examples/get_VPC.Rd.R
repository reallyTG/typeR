library(powerlmm)


### Name: get_VPC
### Title: Calculate the variance partitioning coefficient
### Aliases: get_VPC get_VPC.plcp

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 3,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = 0.05,
                          var_ratio = 0.03)

res <- get_VPC(paras)
res

# Plot
plot(res)



