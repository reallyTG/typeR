library(assertive.types)


### Name: assert_is_closure_function
### Title: Is the input a closure, builtin or special function?
### Aliases: assert_is_builtin_function assert_is_closure_function
###   assert_is_special_function is_builtin_function is_closure_function
###   is_special_function

### ** Examples

# most functions are closures
is_closure_function(mean)
is_closure_function(lm)
is_closure_function(summary)

# builtin functions are typically math operators, low level math functions
# and commonly used functions
is_builtin_function(`*`)
is_builtin_function(cumsum)
is_builtin_function(is.numeric)

# special functions are mostly language features 
is_special_function(`if`)
is_special_function(`return`)
is_special_function(`~`)

# some failure messages
assertive.base::dont_stop({
assert_is_builtin_function(mean)
assert_is_builtin_function("mean")
})



