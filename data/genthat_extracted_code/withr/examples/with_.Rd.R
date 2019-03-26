library(withr)


### Name: local_
### Title: Create a new "with" or "local" function
### Aliases: local_ with_
### Keywords: internal

### ** Examples

with_(setwd)

global_stack <- list()
set_global_state <- function(state, msg = "Changing global state.") {
  global_stack <- c(list(state), global_stack)
  message(msg)
  state
}
reset_global_state <- function(state) {
  old_state <- global_stack[[1]]
  global_stack <- global_stack[-1]
  stopifnot(identical(state, old_state))
}
with_(set_global_state, reset_global_state)



