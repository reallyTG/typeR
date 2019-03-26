library(assertive.types)


### Name: assert_is_a_raw
### Title: Is the input raw?
### Aliases: assert_is_a_raw assert_is_raw is_a_raw is_raw

### ** Examples

assert_is_raw(as.raw(1:10))
assert_is_a_raw(as.raw(255))
#These examples should fail.
assertive.base::dont_stop(assert_is_raw(c(TRUE, FALSE)))
assertive.base::dont_stop(assert_is_a_raw(as.raw(1:10)))
assertive.base::dont_stop(assert_is_a_raw(raw()))



