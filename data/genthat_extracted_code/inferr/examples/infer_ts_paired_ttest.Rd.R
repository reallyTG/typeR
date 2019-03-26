library(inferr)


### Name: infer_ts_paired_ttest
### Title: Paired t test
### Aliases: infer_ts_paired_ttest paired_ttest

### ** Examples

# lower tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'less')

# upper tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'greater')

# both tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'both')

# all tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'all')



