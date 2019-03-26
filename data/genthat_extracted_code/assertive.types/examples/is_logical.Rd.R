library(assertive.types)


### Name: assert_is_a_bool
### Title: Is the input logical?
### Aliases: assert_is_a_bool assert_is_logical is_a_bool is_logical

### ** Examples

assert_is_logical(runif(10) > 0.5)
assert_is_a_bool(TRUE)
assert_is_a_bool(NA)
#These examples should fail.
assertive.base::dont_stop(assert_is_logical(1))
assertive.base::dont_stop(assert_is_a_bool(c(TRUE, FALSE)))
assertive.base::dont_stop(assert_is_a_bool(logical()))



