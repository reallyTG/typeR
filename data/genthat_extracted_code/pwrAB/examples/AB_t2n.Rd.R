library(pwrAB)


### Name: AB_t2n
### Title: Two-Sample t-Test Power Analysis
### Aliases: AB_t2n

### ** Examples

# Search for power given other parameters
AB_t2n(N = 3000, percent_B = .3, mean_diff = .15, sd_A = 1,
sd_B = 2, sig_level = .05, alternative = 'two_sided')

# Search for sample size required to satisfy other parameters
AB_t2n(percent_B = .3, mean_diff = .15, sd_A = 1,
sd_B = 2, sig_level = .05, power = .8, alternative = 'two_sided')




