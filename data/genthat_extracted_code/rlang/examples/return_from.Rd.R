library(rlang)


### Name: return_from
### Title: Jump to or from a frame
### Aliases: return_from return_to

### ** Examples

# Passing fn() evaluation frame to g():
fn <- function() {
  val <- g(current_env())
  cat("g returned:", val, "\n")
  "normal return"
}
g <- function(env) h(env)

# Here we return from fn() with a new return value:
h <- function(env) return_from(env, "early return")
fn()

# Here we return to fn(). The call stack unwinds until the last frame
# called by fn(), which is g() in that case.
h <- function(env) return_to(env, "early return")
fn()



