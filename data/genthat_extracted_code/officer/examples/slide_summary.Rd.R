library(officer)


### Name: slide_summary
### Title: get PowerPoint slide content in a tidy format
### Aliases: slide_summary

### ** Examples

library(magrittr)

my_pres <- read_pptx() %>%
  add_slide(layout = "Two Content", master = "Office Theme") %>%
  ph_with_text(type = "dt", str = format(Sys.Date())) %>%
  add_slide(layout = "Title and Content", master = "Office Theme")

slide_summary(my_pres)
slide_summary(my_pres, index = 1)



