library(inferr)


### Name: infer_ts_ind_ttest
### Title: Two Independent Sample t Test
### Aliases: infer_ts_ind_ttest ind_ttest

### ** Examples

# lower tail
infer_ts_ind_ttest(hsb, female, write, alternative = 'less')

# upper tail
infer_ts_ind_ttest(hsb, female, write, alternative = 'greater')

# both tails
infer_ts_ind_ttest(hsb, female, write, alternative = 'both')

# all tails
infer_ts_ind_ttest(hsb, female, write, alternative = 'all')



