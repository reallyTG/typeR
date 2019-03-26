library(powerlmm)


### Name: get_power
### Title: Calculate power for two- and three-level models with missing
###   data.
### Aliases: get_power

### ** Examples

# Two-level model
paras <- study_parameters(n1 = 11,
                          n2 = 40,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          var_ratio = 0.02,
                          cohend = -0.8)

get_power(paras)

# With missing data
paras <- study_parameters(n1 = 11,
                          n2 = 40,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          var_ratio = 0.02,
                          dropout = dropout_weibull(0.3, 2),
                          cohend = -0.8)


get_power(paras)


# Three-level model
paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 5,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = 0.05,
                          var_ratio = 0.02,
                          cohend = -0.8)

get_power(paras)

# With missing data
paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 5,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          icc_slope = 0.05,
                          var_ratio = 0.02,
                          dropout = dropout_weibull(0.3, 2),
                          cohend = -0.8)

get_power(paras)

# Satterthwaite DFs
get_power(paras, df = "satterthwaite")



