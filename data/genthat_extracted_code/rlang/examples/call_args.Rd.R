library(rlang)


### Name: call_args
### Title: Extract arguments from a call
### Aliases: call_args call_args_names

### ** Examples

call <- quote(f(a, b))

# Subsetting a call returns the arguments converted to a language
# object:
call[-1]

# On the other hand, call_args() returns a regular list that is
# often easier to work with:
str(call_args(call))

# When the arguments are unnamed, a vector of empty strings is
# supplied (rather than NULL):
call_args_names(call)



