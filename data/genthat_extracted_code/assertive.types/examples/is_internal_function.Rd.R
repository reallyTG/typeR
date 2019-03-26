library(assertive.types)


### Name: assert_is_internal_function
### Title: Is the input an internal function?
### Aliases: assert_is_internal_function is_internal_function

### ** Examples

# Some common fns calling .Internal
is_internal_function(unlist)
is_internal_function(cbind)

# Some failures
assertive.base::dont_stop({
assert_is_internal_function("unlist")
assert_is_internal_function(sqrt)
assert_is_internal_function(function(){})
})



