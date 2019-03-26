library(assertive.types)


### Name: assert_is_relistable
### Title: Is the input relistable?
### Aliases: assert_is_relistable is_relistable

### ** Examples

assert_is_relistable(as.relistable(list(1,2,3)))
#These examples should fail.
assertive.base::dont_stop(assert_is_relistable(list(1,2,3)))



