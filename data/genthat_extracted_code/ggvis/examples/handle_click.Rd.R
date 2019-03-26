library(ggvis)


### Name: handle_click
### Title: Handle mouse actions on marks.
### Aliases: handle_click handle_hover

### ** Examples

location <- function(location, ...) cat(location$x, "x", location$y, "\n")
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points() %>%
  handle_click(location)
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points() %>%
  handle_hover(function(...) cat("over\n"), function(...) cat("off\n"))
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points() %>%
  handle_hover(function(data, ...) str(data))



