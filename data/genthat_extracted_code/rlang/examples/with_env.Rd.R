library(rlang)


### Name: with_env
### Title: Evaluate an expression within a given environment
### Aliases: with_env locally

### ** Examples

# with_env() is handy to create formulas with a given environment:
env <- child_env("rlang")
f <- with_env(env, ~new_formula())
identical(f_env(f), env)

# Or functions with a given enclosure:
fn <- with_env(env, function() NULL)
identical(get_env(fn), env)


# Unlike eval() it doesn't create duplicates on the evaluation
# stack. You can thus use it e.g. to create non-local returns:
fn <- function() {
  g(current_env())
  "normal return"
}
g <- function(env) {
  with_env(env, return("early return"))
}
fn()


# Since env is passed to as_environment(), it can be any object with an
# as_environment() method. For strings, the pkg_env() is returned:
with_env("base", ~mtcars)

# This can be handy to put dictionaries in scope:
with_env(mtcars, cyl)



