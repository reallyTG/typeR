library(powerlmm)


### Name: dropout_weibull
### Title: Use the Weibull distribution to specify the dropout process
### Aliases: dropout_weibull

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
plot(p, plot = 2)

# Different per treatment
tx <- dropout_weibull(proportion = 0.3, rate = 3)
cc <- dropout_weibull(proportion = 0.3, rate = 1/3)
dropout <- per_treatment(control = cc,
                         treatment = tx)

p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 6,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      dropout = dropout,
                      cohend = -0.8)

plot(p, plot = 2)

# Compare power for different dropout amounts
dropout <- c(dropout_weibull(proportion = 0.3, rate = 3),
             dropout_weibull(proportion = 0.5, rate = 3),
             dropout_weibull(proportion = 0.5, rate = 1/3))

p <- study_parameters(n1 = 11,
                      n2 = 5,
                      n3 = 6,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      dropout = dropout,
                      cohend = -0.8)

get_power(p)



