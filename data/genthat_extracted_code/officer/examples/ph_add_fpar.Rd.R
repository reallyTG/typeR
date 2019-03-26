library(officer)


### Name: ph_add_fpar
### Title: append fpar
### Aliases: ph_add_fpar

### ** Examples

library(magrittr)

bold_face <- shortcuts$fp_bold(font.size = 30)
bold_redface <- update(bold_face, color = "red")

fpar_ <- fpar(ftext("Hello ", prop = bold_face),
  ftext("World", prop = bold_redface ),
  ftext(", how are you?", prop = bold_face ) )

doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_empty(type = "body") %>%
  ph_add_fpar(value = fpar_, type = "body", level = 2)

print(doc, target = tempfile(fileext = ".pptx"))



