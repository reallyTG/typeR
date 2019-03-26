library(officer)


### Name: body_add_par
### Title: add paragraph of text
### Aliases: body_add_par

### ** Examples

library(magrittr)

doc <- read_docx() %>%
  body_add_par("A title", style = "heading 1") %>%
  body_add_par("Hello world!", style = "Normal") %>%
  body_add_par("centered text", style = "centered")

print(doc, target = tempfile(fileext = ".docx") )



