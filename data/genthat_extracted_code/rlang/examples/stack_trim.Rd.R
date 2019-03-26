library(rlang)


### Name: stack_trim
### Title: Trim top call layers from the evaluation stack
### Aliases: stack_trim
### Keywords: internal

### ** Examples

# Intervening frames appear on the evaluation stack:
identity(identity(ctxt_stack()))

# stack_trim() will trim the first n layers of calls:
stack_trim(identity(identity(ctxt_stack())))

# Note that it also takes care of calls intervening at its own call
# site:
identity(identity(
  stack_trim(identity(identity(ctxt_stack())))
))

# It is especially useful when used within a function that needs to
# inspect the evaluation stack but should nonetheless be callable
# within nested calls without side effects:
stack_util <- function() {
  # n = 2 means that two layers of intervening calls should be
  # removed: The layer at ctxt_stack()'s call site (including the
  # stack_trim() call), and the layer at stack_util()'s call.
  stack <- stack_trim(ctxt_stack(), n = 2)
  stack
}
user_fn <- function() {
  # A user calls your stack utility with intervening frames:
  identity(identity(stack_util()))
}
# These intervening frames won't appear in the evaluation stack
identity(user_fn())



