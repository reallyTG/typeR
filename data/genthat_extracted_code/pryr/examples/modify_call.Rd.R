library(pryr)


### Name: modify_call
### Title: Modify the arguments of a call.
### Aliases: modify_call

### ** Examples

call <- quote(mean(x, na.rm = TRUE))

# Modify an existing argument
modify_call(call, list(na.rm = FALSE))
modify_call(call, list(x = quote(y)))

# Remove an argument
modify_call(call, list(na.rm = NULL))

# Add a new argument
modify_call(call, list(trim = 0.1))

# Add an explicit missing argument
modify_call(call, list(na.rm = quote(expr = )))



