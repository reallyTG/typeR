library(officer)


### Name: body_add_break
### Title: add page break
### Aliases: body_add_break

### ** Examples

library(magrittr)
doc <- read_docx() %>% body_add_break()
print(doc, target = tempfile(fileext = ".docx"))



