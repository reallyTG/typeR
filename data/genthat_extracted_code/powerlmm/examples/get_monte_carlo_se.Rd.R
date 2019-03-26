library(powerlmm)


### Name: get_monte_carlo_se
### Title: Calculate the Monte Carlo standard error of the empirical power
###   estimates
### Aliases: get_monte_carlo_se get_monte_carlo_se.plcp_power_3lvl
###   get_monte_carlo_se.plcp_power_2lvl

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 6,
                          T_end = 10,
                          icc_pre_subject = 0.5,
                          icc_pre_cluster = 0,
                          var_ratio = 0.03,
                          icc_slope = 0.05,
                          cohend = -0.8)

x <- get_power(paras)
get_monte_carlo_se(x, nsim = 1000)

# Without an object
get_monte_carlo_se(power = 0.8, nsim = 1000)



