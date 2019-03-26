library(powerlmm)


### Name: dropout_manual
### Title: Manually specify dropout per time point
### Aliases: dropout_manual

### ** Examples

dropout <- dropout_manual(0, 0, 0, 0, 0.2, 0.2, 0.3, 0.3, 0.4, 0.4, 0.45)

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
get_power(p)

# Can also use a vector as input
dropout <- dropout_manual(seq(0, 0.5, length.out = 11))
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
get_power(p)

## Not run: 
##D # Decreasing dropout will throw an error
##D dropout_manual(0, 0.1, 0.1, 0.2, 0.1)
##D 
##D # Dropout at the first time point will throw an error
##D dropout_manual(0.1, 0.1, 0.1, 0.2, 0.2)
## End(Not run)



