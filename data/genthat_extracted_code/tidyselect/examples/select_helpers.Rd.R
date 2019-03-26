library(tidyselect)


### Name: select_helpers
### Title: Select helpers
### Aliases: select_helpers starts_with ends_with contains matches
###   num_range one_of everything last_col

### ** Examples

nms <- names(iris)
vars_select(nms, starts_with("Petal"))
vars_select(nms, ends_with("Width"))
vars_select(nms, contains("etal"))
vars_select(nms, matches(".t."))
vars_select(nms, Petal.Length, Petal.Width)
vars_select(nms, everything())
vars_select(nms, last_col())
vars_select(nms, last_col(offset = 2))

vars <- c("Petal.Length", "Petal.Width")
vars_select(nms, one_of(vars))



