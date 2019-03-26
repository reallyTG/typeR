library(rlang)


### Name: stack
### Title: Call stack information
### Aliases: stack global_frame current_frame ctxt_frame call_frame
###   ctxt_depth call_depth ctxt_stack call_stack
### Keywords: internal

### ** Examples

# Expressions within arguments count as contexts
identity(identity(ctxt_depth())) # returns 2

# But they are not part of the call stack because arguments are
# evaluated within the calling function (or the global environment
# if called at top level)
identity(identity(call_depth())) # returns 0

# The context stacks includes all intervening execution frames. The
# call stack doesn't:
f <- function(x) identity(x)
f(f(ctxt_stack()))
f(f(call_stack()))

g <- function(cmd) cmd()
f(g(ctxt_stack))
f(g(call_stack))

# The rlang _stack() functions return a list of frame
# objects. Use purrr::transpose() or index a field with
# purrr::map()'s to extract a particular field from a stack:

# stack <- f(f(call_stack()))
# purrr::map(stack, "env")
# purrr::transpose(stack)$expr

# current_frame() is an alias for ctxt_frame(1)
fn <- function() list(current = current_frame(), first = ctxt_frame(1))
fn()

# While current_frame() is the top of the stack, global_frame() is
# the bottom:
fn <- function() {
  n <- ctxt_depth()
  ctxt_frame(n)
}
identical(fn(), global_frame())


# ctxt_stack() returns a stack with all intervening frames. You can
# trim layers of intervening frames with the trim argument:
identity(identity(ctxt_stack()))
identity(identity(ctxt_stack(trim = 1)))

# ctxt_stack() is called within fn() with intervening frames:
fn <- function(trim) identity(identity(ctxt_stack(trim = trim)))
fn(0)

# We can trim the first layer of those:
fn(1)

# The outside intervening frames (at the fn() call site) are still
# returned, but can be trimmed as well:
identity(identity(fn(1)))
identity(identity(fn(2)))

g <- function(trim) identity(identity(fn(trim)))
g(2)
g(3)



