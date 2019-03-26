library(inferr)


### Name: infer_os_t_test
### Title: One Sample t Test
### Aliases: infer_os_t_test ttest

### ** Examples

# lower tail
infer_os_t_test(hsb, write, mu = 50, alternative = 'less')

# upper tail
infer_os_t_test(hsb, write, mu = 50, alternative = 'greater')

# both tails
infer_os_t_test(hsb, write, mu = 50, alternative = 'both')

# all tails
infer_os_t_test(hsb, write, mu = 50, alternative = 'all')



