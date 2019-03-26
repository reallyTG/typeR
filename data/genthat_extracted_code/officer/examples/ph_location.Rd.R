library(officer)


### Name: ph_location
### Title: create a location for a placeholder
### Aliases: ph_location

### ** Examples

library(magrittr)
read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello world",
    location = ph_location(width = 4, height = 3, label = "hello") ) %>%
  print(target = tempfile(fileext = ".pptx") )



