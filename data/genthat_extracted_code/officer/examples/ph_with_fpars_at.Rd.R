library(officer)


### Name: ph_with_fpars_at
### Title: add multiple formated paragraphs
### Aliases: ph_with_fpars_at

### ** Examples


fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content",
  master = "Office Theme")

bold_face <- shortcuts$fp_bold(font.size = 0)
bold_redface <- update(bold_face, color = "red")

fpar_1 <- fpar(
  ftext("Hello ", prop = bold_face), ftext("World", prop = bold_redface ),
  ftext(", \r\nhow are you?", prop = bold_face ) )

fpar_2 <- fpar(
  ftext("Hello ", prop = bold_face), ftext("World", prop = bold_redface ),
  ftext(", \r\nhow are you again?", prop = bold_face ) )

doc <- ph_with_fpars_at(x = doc, fpars = list(fpar_1, fpar_2),
  fp_pars = list(NULL, fp_par(text.align = "center")),
  left = 1, top = 2, width = 7, height = 4)
doc <- ph_with_fpars_at(x = doc, fpars = list(fpar_1, fpar_2),
  template_type = "body", template_index = 1,
  left = 4, top = 5, width = 4, height = 3)

print(doc, target = fileout )



