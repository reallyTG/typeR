library(assertive.types)


### Name: assert_is_a_double
### Title: Is the input numeric?
### Aliases: assert_is_a_double assert_is_a_number assert_is_double
###   assert_is_numeric is_a_double is_a_number is_double is_numeric

### ** Examples

# "numeric" fns work on double or integers; 
assert_is_numeric(1:10)

# Here we check for length 1 as well as type
assert_is_a_number(pi)
assert_is_a_number(1L)
assert_is_a_number(NA_real_)

# "double" fns fail for integers.
assert_is_a_double(pi)

#These examples should fail.
assertive.base::dont_stop(assert_is_numeric(c(TRUE, FALSE)))
assertive.base::dont_stop(assert_is_a_number(1:10))
assertive.base::dont_stop(assert_is_a_number(numeric()))
assertive.base::dont_stop(assert_is_double(1:10))



