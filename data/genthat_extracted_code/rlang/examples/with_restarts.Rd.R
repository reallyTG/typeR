library(rlang)


### Name: with_restarts
### Title: Establish a restart point on the stack
### Aliases: with_restarts

### ** Examples

# Restarts are not the only way to jump to a previous frame, but
# they have the advantage of being callable by name:
fn <- function() with_restarts(g(), my_restart = function() "returned")
g <- function() h()
h <- function() { rst_jump("my_restart"); "not returned" }
fn()

# Whereas a non-local return requires to manually pass the calling
# frame to the return function:
fn <- function() g(current_env())
g <- function(env) h(env)
h <- function(env) { return_from(env, "returned"); "not returned" }
fn()


# rst_maybe_jump() checks that a restart exists before trying to jump:
fn <- function() {
  g()
  cat("will this be called?\n")
}
g <- function() {
  rst_maybe_jump("my_restart")
  cat("will this be called?\n")
}

# Here no restart are on the stack:
fn()

# If a restart point called `my_restart` was established on the
# stack before calling fn(), the control flow will jump there:
rst <- function() {
  cat("restarting...\n")
  "return value"
}
with_restarts(fn(), my_restart = rst)


# Restarts are particularly useful to provide alternative default
# values when the normal output cannot be computed:

fn <- function(valid_input) {
  if (valid_input) {
    return("normal value")
  }

  # We decide to return the empty string "" as default value. An
  # altenative strategy would be to signal an error. In any case,
  # we want to provide a way for the caller to get a different
  # output. For this purpose, we provide two restart functions that
  # returns alternative defaults:
  restarts <- list(
    rst_empty_chr = function() character(0),
    rst_null = function() NULL
  )

  with_restarts(splice(restarts), .expr = {

    # Signal a typed condition to let the caller know that we are
    # about to return an empty string as default value:
    cnd_signal("default_empty_string")

    # If no jump to with_restarts, return default value:
    ""
  })
}

# Normal value for valid input:
fn(TRUE)

# Default value for bad input:
fn(FALSE)

# Change the default value if you need an empty character vector by
# defining a calling handler that jumps to the restart. It has to
# be calling because exiting handlers jump to the place where they
# are established before being executed, and the restart is not
# defined anymore at that point:
rst_handler <- calling(function(c) rst_jump("rst_empty_chr"))
with_handlers(fn(FALSE), default_empty_string = rst_handler)

# You can use restarting() to create restarting handlers easily:
with_handlers(fn(FALSE), default_empty_string = restarting("rst_null"))



