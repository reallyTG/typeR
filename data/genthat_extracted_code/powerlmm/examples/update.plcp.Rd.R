library(powerlmm)


### Name: update.plcp
### Title: Update a 'study_parameters'-object with new settings
### Aliases: update.plcp

### ** Examples

p <- study_parameters(n1 = 11,
                      n2 = 10,
                      n3 = 3,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)

p <- update(p, icc_slope = 0.1)
get_ICC_slope(p)

## Not run: 
##D # Using a "new" argument does not work (yet)
##D update(p, sigma_cluster_slope = 2)
## End(Not run)



