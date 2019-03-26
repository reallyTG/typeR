library(officer)


### Name: body_add_table
### Title: add table
### Aliases: body_add_table

### ** Examples

library(magrittr)

doc <- read_docx() %>%
  body_add_table(iris, style = "table_template")

print(doc, target = tempfile(fileext = ".docx") )



