library(inferr)


### Name: infer_os_var_test
### Title: One Sample Variance Comparison Test
### Aliases: infer_os_var_test os_vartest

### ** Examples

# lower tail
infer_os_var_test(mtcars, mpg, 5, alternative = 'less')

# upper tail
infer_os_var_test(mtcars, mpg, 5, alternative = 'greater')

# both tails
infer_os_var_test(mtcars, mpg, 5, alternative = 'both')

# all tails
infer_os_var_test(mtcars, mpg, 5, alternative = 'all')



