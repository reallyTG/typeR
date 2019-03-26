library(officer)


### Name: body_add_toc
### Title: add table of content
### Aliases: body_add_toc

### ** Examples

library(magrittr)
doc <- read_docx() %>% body_add_toc()

print(doc, target = tempfile(fileext = ".docx") )



