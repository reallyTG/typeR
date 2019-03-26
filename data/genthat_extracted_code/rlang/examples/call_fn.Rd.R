library(rlang)


### Name: call_fn
### Title: Extract function from a call
### Aliases: call_fn

### ** Examples

# Extract from a quoted call:
call_fn(quote(matrix()))
call_fn(quo(matrix()))

# Extract the calling function
test <- function() call_fn(call_frame())
test()



