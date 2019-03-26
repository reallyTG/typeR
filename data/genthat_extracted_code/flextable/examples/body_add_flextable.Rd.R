library(flextable)


### Name: body_add_flextable
### Title: add flextable into a Word document
### Aliases: body_add_flextable

### ** Examples

library(officer)
ft <- flextable(head(mtcars))
ft <- theme_zebra(ft)
## No test: 
ft <- autofit(ft)
## End(No test)
doc <- read_docx()
doc <- body_add_flextable(doc, value = ft)
## No test: 
print(doc, target = "test.docx")
## End(No test)



