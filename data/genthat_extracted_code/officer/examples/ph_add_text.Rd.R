library(officer)


### Name: ph_add_text
### Title: append text
### Aliases: ph_add_text

### ** Examples

library(magrittr)
fileout <- tempfile(fileext = ".pptx")
my_pres <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_empty(type = "body")

small_red <- fp_text(color = "red", font.size = 14)

my_pres <- my_pres %>%
  ph_add_par(level = 3) %>%
  ph_add_text(str = "A small red text.", style = small_red) %>%
  ph_add_par(level = 2) %>%
  ph_add_text(str = "Level 2")

print(my_pres, target = fileout)


fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_text(type = "title", str = "Un titre 1") %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_text(type = "title", str = "Un titre 2") %>%
  on_slide(1) %>%
  ph_empty(type = "body") %>%
  ph_add_par(type = "body", level = 2) %>%
  ph_add_text(str = "Jump here to slide 2!", type = "body",
  slide_index = 2)

print(doc, target = fileout)



