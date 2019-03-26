library(rlang)


### Name: restarting
### Title: Create a restarting handler
### Aliases: restarting

### ** Examples

# This is a restart that takes a data frame and names as arguments
rst_bar <- function(df, nms) {
  stats::setNames(df, nms)
}

# This restart is simpler and does not take arguments
rst_baz <- function() "baz"

# Signalling a condition parameterised with a data frame
fn <- function() {
  with_restarts(signal("A foobar condition occurred", "foo", foo_field = mtcars),
    rst_bar = rst_bar,
    rst_baz = rst_baz
  )
}

# Creating a restarting handler that passes arguments `nms` and
# `df`, the latter taken from a data field of the condition object
restart_bar <- restarting("rst_bar",
  nms = LETTERS[1:11], .fields = c(df = "foo_field")
)

# The restarting handlers jumps to `rst_bar` when `foo` is signalled:
with_handlers(fn(), foo = restart_bar)

# The restarting() constructor is especially nice to use with
# restarts that do not need arguments:
with_handlers(fn(), foo = restarting("rst_baz"))



