library(inferr)


### Name: infer_ts_prop_test
### Title: Two Sample Test of Proportion
### Aliases: infer_ts_prop_test ts_prop_test infer_ts_prop_grp ts_prop_grp
###   infer_ts_prop_calc ts_prop_calc

### ** Examples

# using variables
# lower tail
infer_ts_prop_test(treatment, treatment1, treatment2,
alternative = 'less')

# using groups
# lower tail
infer_ts_prop_grp(treatment2, outcome, female,
alternative = 'less')

# using sample size and proportions
# lower tail
infer_ts_prop_calc(n1 = 30, n2 = 25, p1 = 0.3, p2 = 0.5, alternative = 'less')




