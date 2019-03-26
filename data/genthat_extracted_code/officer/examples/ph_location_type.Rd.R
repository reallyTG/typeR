library(officer)


### Name: ph_location_type
### Title: location of a placeholder type
### Aliases: ph_location_type

### ** Examples

library(magrittr)
read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello world", location = ph_location_type(type = "body") ) %>%
  print(target = tempfile(fileext = ".pptx") )



