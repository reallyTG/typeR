library(pwrAB)


### Name: AB_t2n_prop
### Title: Two-Sample t-Test Power Analysis for Proportions
### Aliases: AB_t2n_prop

### ** Examples

# Search for power given other parameters
AB_t2n_prop(prop_A = .2, prop_B = .25,
           N = 3000, percent_B = .3,
           sig_level = .05, alternative = 'two_sided')

# Search for proportion in group B required to satisfy other parameters
AB_t2n_prop(prop_A = .2, N = 3000, percent_B = .3,
power = .8, sig_level = .05,
alternative = 'two_sided')




