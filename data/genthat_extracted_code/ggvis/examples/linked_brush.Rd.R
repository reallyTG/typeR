library(ggvis)


### Name: linked_brush
### Title: Create a linked brush object.
### Aliases: linked_brush

### ** Examples

lb <- linked_brush(keys = 1:nrow(mtcars), "red")

# Change the colour of the points
mtcars %>%
 ggvis(~disp, ~mpg) %>%
 layer_points(fill := lb$fill, size.brush := 400) %>%
 lb$input()

# Display one layer with all points and another layer with selected points
library(shiny)
mtcars %>%
 ggvis(~disp, ~mpg) %>%
 layer_points(size.brush := 400) %>%
 lb$input() %>%
 layer_points(fill := "red", data = reactive(mtcars[lb$selected(), ]))



