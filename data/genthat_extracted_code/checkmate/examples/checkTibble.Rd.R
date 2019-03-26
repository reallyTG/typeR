library(checkmate)


### Name: checkTibble
### Title: Check if an argument is a tibble
### Aliases: checkTibble check_tibble assertTibble assert_tibble testTibble
###   test_tibble expect_tibble

### ** Examples

library(tibble)
x = as_tibble(iris)
testTibble(x)
testTibble(x, nrow = 150, any.missing = FALSE)



