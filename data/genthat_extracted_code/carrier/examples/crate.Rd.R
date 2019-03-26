library(carrier)


### Name: crate
### Title: Crate a function to share with another process
### Aliases: crate

### ** Examples

# You can create functions using the ordinary notation:
crate(function(x) stats::var(x))

# Or the formula notation:
crate(~stats::var(.x))

# Declare data by supplying named arguments. You can test you have
# declared all necessary data by calling your crated function:
na_rm <- TRUE
fn <- crate(~stats::var(.x, na.rm = na_rm))
try(fn(1:10))

# For small data it is handy to unquote instead. Unquoting inlines
# objects inside the function. This is less verbose if your
# function depends on many small objects:
fn <- crate(~stats::var(.x, na.rm = !!na_rm))
fn(1:10)

# One downside is that the individual sizes of unquoted objects
# won't be shown in the crate printout:
fn


# The function or formula you pass to crate() should defined inside
# the crate() call, i.e. you can't pass an already defined
# function:
fn <- function(x) toupper(x)
try(crate(fn))

# If you really need to crate an existing function, you can
# explicitly set its environment to the crate environment with the
# set_env() function from rlang:
crate(rlang::set_env(fn))



