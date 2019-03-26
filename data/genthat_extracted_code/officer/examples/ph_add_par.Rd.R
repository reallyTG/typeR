library(officer)


### Name: ph_add_par
### Title: append paragraph
### Aliases: ph_add_par

### ** Examples

library(magrittr)

fileout <- tempfile(fileext = ".pptx")
default_text <- fp_text(font.size = 0, bold = TRUE, color = "red")

doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_text(type = "body", str = "A text") %>%
  ph_add_par(level = 2) %>%
  ph_add_text(str = "and another, ", style = default_text ) %>%
  ph_add_par(level = 3) %>%
  ph_add_text(str = "and another!",
    style = update(default_text, color = "blue"))

print(doc, target = fileout)



