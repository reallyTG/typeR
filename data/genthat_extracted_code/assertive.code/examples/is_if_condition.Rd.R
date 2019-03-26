library(assertive.code)


### Name: assert_is_if_condition
### Title: Is suitable to be used as an if condition
### Aliases: assert_is_if_condition is_if_condition

### ** Examples

is_if_condition(TRUE)
is_if_condition(FALSE)
is_if_condition(NA)
is_if_condition(c(TRUE, FALSE))
is_if_condition("the truth")
# You can pass a number as a logical condition, but you shouldn't,
# so the next line returns FALSE.
is_if_condition(1)
assertive.base::dont_stop(assert_is_if_condition(raw(1)))



