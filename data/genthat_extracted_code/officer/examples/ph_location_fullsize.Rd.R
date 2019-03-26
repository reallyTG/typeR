library(officer)


### Name: ph_location_fullsize
### Title: location of a full size element
### Aliases: ph_location_fullsize

### ** Examples

library(magrittr)
my_pres <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello world", location = ph_location_fullsize() ) %>%
  print(target = tempfile(fileext = ".pptx") )



