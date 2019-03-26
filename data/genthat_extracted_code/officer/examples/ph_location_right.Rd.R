library(officer)


### Name: ph_location_right
### Title: location of a right body element
### Aliases: ph_location_right

### ** Examples

library(magrittr)
read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello", location = ph_location_left() ) %>%
  ph_with("world", location = ph_location_right() ) %>%
  print(target = tempfile(fileext = ".pptx") )



