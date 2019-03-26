library(officer)


### Name: ph_location_left
### Title: location of a left body element
### Aliases: ph_location_left

### ** Examples

library(magrittr)
read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello", location = ph_location_left() ) %>%
  ph_with("world", location = ph_location_right() ) %>%
  print(target = tempfile(fileext = ".pptx") )



