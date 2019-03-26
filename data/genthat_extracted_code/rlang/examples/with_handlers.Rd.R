library(rlang)


### Name: with_handlers
### Title: Establish handlers on the stack
### Aliases: with_handlers

### ** Examples

# Signal a condition with signal():
fn <- function() {
  g()
  cat("called?\n")
  "fn() return value"
}
g <- function() {
  h()
  cat("called?\n")
}
h <- function() {
  signal("A foobar condition occurred", "foo")
  cat("called?\n")
}

# Exiting handlers jump to with_handlers() before being
# executed. Their return value is handed over:
handler <- function(c) "handler return value"
with_handlers(fn(), foo = exiting(handler))

# Handlers are exiting by default so you can omit the adjective:
with_handlers(fn(), foo = handler)

# In place handlers are called in turn and their return value is
# ignored. Returning just means they are declining to take charge of
# the condition. However, they can produce side-effects such as
# displaying a message:
some_handler <- function(c) cat("some handler!\n")
other_handler <- function(c) cat("other handler!\n")
with_handlers(fn(), foo = calling(some_handler), foo = calling(other_handler))

# If an in place handler jumps to an earlier context, it takes
# charge of the condition and no other handler gets a chance to
# deal with it. The canonical way of transferring control is by
# jumping to a restart. See with_restarts() and restarting()
# documentation for more on this:
exiting_handler <- function(c) rst_jump("rst_foo")
fn2 <- function() {
  with_restarts(g(), rst_foo = function() "restart value")
}
with_handlers(fn2(), foo = calling(exiting_handler), foo = calling(other_handler))



