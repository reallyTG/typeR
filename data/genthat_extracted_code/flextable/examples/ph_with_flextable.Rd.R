library(flextable)


### Name: ph_with_flextable
### Title: add flextable into a PowerPoint slide
### Aliases: ph_with_flextable ph_with_flextable_at

### ** Examples

library(officer)
ft <- flextable(head(mtcars))
## No test: 
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content",
                 master = "Office Theme")
doc <- ph_with_flextable(doc, value = ft, type = "body")
doc <- ph_with_flextable_at(doc, value = ft, left = 4, top = 5)
## No test: 
print(doc, target = "test.pptx" )
## End(No test)
## End(No test)



