library(rlang)


### Name: caller_env
### Title: Get the current or caller environment
### Aliases: caller_env current_env

### ** Examples

# Let's create a function that returns its current environment and
# its caller environment:
fn <- function() list(current = current_env(), caller = caller_env())

# The current environment is an unique execution environment
# created when `fn()` was called. The caller environment is the
# global env because that's where we called `fn()`.
fn()

# Let's call `fn()` again but this time within a function:
g <- function() fn()

# Now the caller environment is also an unique execution environment.
# This is the exec env created by R for our call to g():
g()



