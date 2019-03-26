library(checkmate)


### Name: checkInteger
### Title: Check if an argument is vector of type integer
### Aliases: checkInteger check_integer assertInteger assert_integer
###   testInteger test_integer expect_integer

### ** Examples

testInteger(1L)
testInteger(1.)
testInteger(1:2, lower = 1, upper = 2, any.missing = FALSE)



