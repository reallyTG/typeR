library(assertive.base)


### Name: call_and_name
### Title: Call a function, and give the result names.
### Aliases: call_and_name

### ** Examples

call_and_name(is.finite, c(1, Inf, NA))

# Make sure that the output is the same size as the input.
# Don't do this:
dont_stop(call_and_name(isTRUE, list(TRUE, FALSE, NA)))
# Do this instead:
call_and_name(
  Vectorize(isTRUE, SIMPLIFY = FALSE),
  list(TRUE, FALSE, NA)
)



