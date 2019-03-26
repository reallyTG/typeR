library(inferr)


### Name: infer_ts_var_test
### Title: Two Sample Variance Comparison Test
### Aliases: infer_ts_var_test var_test

### ** Examples

# using grouping variable
infer_ts_var_test(hsb, read, group_var = female, alternative = 'less')

# using two variables
infer_ts_var_test(hsb, read, write, alternative = 'less')




