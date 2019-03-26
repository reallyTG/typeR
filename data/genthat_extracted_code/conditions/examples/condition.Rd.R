library(conditions)


### Name: assertion_message
### Title: Generate a custom condition
### Aliases: assertion_error assertion_message assertion_warning condition
###   condition_error condition_message condition_warning deprecated_error
###   deprecated_message deprecated_warning dimension_error
###   dimension_message dimension_warning future_error future_message
###   future_warning index_error index_message index_warning io_error
###   io_message io_warning length_error length_message length_warning
###   library_error library_message library_warning lookup_error
###   lookup_message lookup_warning missing_error missing_message
###   missing_warning name_error name_message name_warning runtime_error
###   runtime_message runtime_warning type_error type_message type_warning
###   value_error value_message value_warning

### ** Examples

# A simple IO error:
e = condition_error("io", "Failed to load file")
print(e)
class(e)

# To signal the condition, use message/warning/stop.
## Not run: 
##D message(e)
##D warning(e)
##D stop(e)
## End(Not run)

# These are equivalent (except the call):
w1 = condition("warning", "dimension_warning", "foo")
w2 = condition_warning("dimension", "foo")
w3 = tryCatch(dimension_warning("foo"), condition = function(e) e)

# Attach and retrieve additional information
f = function(x) {
  if(!is.numeric(x))
    assertion_error(" must be numeric", attach = x)
  x^2
}
f(1:10)

tryCatch(f(letters), assertion_error = function(e) {
  message("x must be numeric, but is ", typeof(e$attached))
})



