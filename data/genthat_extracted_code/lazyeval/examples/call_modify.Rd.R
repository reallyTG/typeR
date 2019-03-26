library(lazyeval)


### Name: call_modify
### Title: Modify the arguments of a call.
### Aliases: call_modify call_standardise

### ** Examples

call <- quote(mean(x, na.rm = TRUE))
call_standardise(call)

# Modify an existing argument
call_modify(call, list(na.rm = FALSE))
call_modify(call, list(x = quote(y)))

# Remove an argument
call_modify(call, list(na.rm = NULL))

# Add a new argument
call_modify(call, list(trim = 0.1))

# Add an explicit missing argument
call_modify(call, list(na.rm = quote(expr = )))



