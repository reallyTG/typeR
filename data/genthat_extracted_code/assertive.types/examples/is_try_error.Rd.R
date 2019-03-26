library(assertive.types)


### Name: assert_is_try_error
### Title: Is the input a condition?
### Aliases: assert_is_condition assert_is_error assert_is_message
###   assert_is_simple_error assert_is_simple_message
###   assert_is_simple_warning assert_is_try_error assert_is_warning
###   is_condition is_error is_message is_simple_error is_simple_message
###   is_simple_warning is_try_error is_warning

### ** Examples

# stop returns simpleErrors, unless wrapped in a call to try
simple_err <- tryCatch(stop("!!!"), error = function(e) e)
is_simple_error(simple_err)
try_err <- try(stop("!!!"))
is_try_error(try_err)

# is_error checks for both error types
is_error(try_err)
is_error(simple_err)

# warning returns simpleWarnings
simple_warn <- tryCatch(warning("!!!"), warning = function(w) w)
is_simple_warning(simple_warn)
is_warning(simple_warn)

# message returns simpleMessages
simple_msg <- tryCatch(message("!!!"), message = function(m) m)
is_simple_message(simple_msg)
is_message(simple_msg)

# These examples should fail.
assertive.base::dont_stop(assert_is_simple_error(try_err))
assertive.base::dont_stop(assert_is_try_error(simple_err))



