library(assertive.types)


### Name: assert_is_an_integer
### Title: Is the input an integer?
### Aliases: assert_is_an_integer assert_is_integer is_an_integer
###   is_integer

### ** Examples

assert_is_integer(1:10)
assert_is_an_integer(99L)
#These examples should fail.
assertive.base::dont_stop(assert_is_integer(c(1, 2, 3)))
assertive.base::dont_stop(assert_is_an_integer(1:10))
assertive.base::dont_stop(assert_is_an_integer(integer()))



