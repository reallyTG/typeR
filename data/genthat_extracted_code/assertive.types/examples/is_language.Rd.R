library(assertive.types)


### Name: assert_is_call
### Title: Is the input a language object?
### Aliases: assert_is_call assert_is_expression assert_is_language
###   assert_is_name assert_is_symbol is_call is_expression is_language
###   is_name is_symbol

### ** Examples

a_call <- call("sin", "pi")
assert_is_call(a_call)
assert_is_language(a_call)
an_expression <- expression(sin(pi))
assert_is_expression(an_expression)
assert_is_language(an_expression)
a_name <- as.name("foo")
assert_is_name(a_name)
assert_is_language(a_name)
#These examples should fail.
assertive.base::dont_stop(assert_is_language(function(){}))



