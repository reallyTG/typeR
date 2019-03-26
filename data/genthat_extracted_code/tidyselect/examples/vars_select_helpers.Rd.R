library(tidyselect)


### Name: vars_select_helpers
### Title: List of selection helpers
### Aliases: vars_select_helpers
### Keywords: datasets

### ** Examples

# You can easily embed the helpers by burying them in the scopes of
# input quosures. For this example we need an environment where
# tidyselect is not attached:
local(envir = baseenv(), {
  vars <- c("foo", "bar", "baz")
  helpers <- tidyselect::vars_select_helpers

  my_select <- function(...) {
    quos <- rlang::quos(...)
    quos <- lapply(quos, rlang::env_bury, !!! helpers)

    tidyselect::vars_select(vars, !!! quos)
  }

  # The user can now call my_select() with helpers without having
  # to attach tidyselect:
  my_select(starts_with("b"))
})



