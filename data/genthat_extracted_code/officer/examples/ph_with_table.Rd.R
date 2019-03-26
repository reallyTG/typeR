library(officer)


### Name: ph_with_table
### Title: add table
### Aliases: ph_with_table ph_with_table_at

### ** Examples

library(magrittr)

doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_table(value = mtcars[1:6,], type = "body",
    last_row = FALSE, last_column = FALSE, first_row = TRUE)

print(doc, target = tempfile(fileext = ".pptx"))

library(magrittr)

doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_table_at(value = mtcars[1:6,],
    height = 4, width = 8, left = 4, top = 4,
    last_row = FALSE, last_column = FALSE, first_row = TRUE)

print(doc, target = tempfile(fileext = ".pptx"))



