library(assertive.types)


### Name: assert_is_all_of
### Title: Does x belong to these classes?
### Aliases: assert_is_all_of assert_is_any_of

### ** Examples

assert_is_all_of(1:10, c("integer", "numeric"))
#These examples should fail.
assertive.base::dont_stop(assert_is_any_of(1:10, c("list", "data.frame")))



