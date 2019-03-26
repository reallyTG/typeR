library(tidyselect)


### Name: poke_vars
### Title: Replace or get current variables
### Aliases: poke_vars peek_vars scoped_vars with_vars has_vars

### ** Examples

poke_vars(letters)
peek_vars()

# Now that the variables are registered, the helpers can figure out
# the positions of elements within the variable vector:
one_of(c("d", "z"))

# In a function be sure to restore the previous variables. An exit
# hook is the best way to do it:
fn <- function(vars) {
  old <- poke_vars(vars)
  on.exit(poke_vars(old))

  one_of("d")
}
fn(letters)
fn(letters[3:5])

# The previous variables are still registered after fn() was
# called:
peek_vars()


# It is recommended to use the scoped variant as it restores the
# state automatically when the function returns:
fn <- function(vars) {
  scoped_vars(vars)
  starts_with("r")
}
fn(c("red", "blue", "rose"))

# The with_vars() helper makes it easy to pass an expression that
# should be evaluated in a variable context. Thanks to lazy
# evaluation, you can just pass the expression argument from your
# wrapper to with_vars():
fn <- function(expr) {
  vars <- c("red", "blue", "rose")
  with_vars(vars, expr)
}
fn(starts_with("r"))



