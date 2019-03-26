library(olsrr)


### Name: ols_test_bartlett
### Title: Bartlett test
### Aliases: ols_test_bartlett ols_test_bartlett.default ols_bartlett_test

### ** Examples

# using grouping variable
library(descriptr)
ols_test_bartlett(mtcarz, mpg, group_var = cyl)

# using variables
ols_test_bartlett(hsb, read, write)




