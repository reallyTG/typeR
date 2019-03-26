library(checkmate)


### Name: checkIntegerish
### Title: Check if an object is an integerish vector
### Aliases: checkIntegerish check_integerish assertIntegerish
###   assert_integerish testIntegerish test_integerish expect_integerish

### ** Examples

testIntegerish(1L)
testIntegerish(1.)
testIntegerish(1:2, lower = 1L, upper = 2L, any.missing = FALSE)



