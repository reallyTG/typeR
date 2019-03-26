library(assertive.code)


### Name: assert_is_valid_r_code
### Title: Is the input valid R code?
### Aliases: assert_is_valid_r_code is_valid_r_code

### ** Examples

is_valid_r_code("x <- 1 + sqrt(pi)")
is_valid_r_code("x <- ")
is_valid_r_code("<- 1 + sqrt(pi)")



