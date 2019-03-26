library(ggvis)


### Name: handle_brush
### Title: Handle brush events on a visualisation.
### Aliases: handle_brush

### ** Examples

# Display tooltip when objects are brushed
mtcars %>%
  ggvis(x = ~wt, y = ~mpg, size.brush := 400) %>%
  layer_points() %>%
  handle_brush(function(items, page_loc, session, ...) {
    show_tooltip(session, page_loc$r + 5, page_loc$t, html = nrow(items))
  })



