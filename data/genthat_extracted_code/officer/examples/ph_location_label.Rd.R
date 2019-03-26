library(officer)


### Name: ph_location_label
### Title: location of a named placeholder
### Aliases: ph_location_label

### ** Examples

library(magrittr)
read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello world",
    location = ph_location_label(ph_label = "Content Placeholder 2") ) %>%
  print(target = tempfile(fileext = ".pptx") )



