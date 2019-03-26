library(powerlmm)


### Name: get_power_table
### Title: Create a power table for a combination of parameter values
### Aliases: get_power_table

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

# increase only n2
x <- get_power_table(paras, n2 = 10:15)
plot(x)

# Compare two parameters
x <- get_power_table(paras, n2 = 10:15, n3 = 6:8)
plot(x)

# Compare impact of three parameters
x <- get_power_table(paras, n2 = seq(3, 25, by = 3),
                            n3 = c(3,6,9),
                            icc_slope = c(0, 0.05, 0.1))
plot(x)



