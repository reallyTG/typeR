library(powerlmm)


### Name: get_dropout
### Title: Get the amount of dropout
### Aliases: get_dropout get_dropout.plcp_multi

### ** Examples

p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 6,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      dropout = dropout_weibull(proportion = 0.3, rate = 3),
                      cohend = -0.8)
get_dropout(p)



