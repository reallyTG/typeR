library(officer)


### Name: on_slide
### Title: change current slide
### Aliases: on_slide

### ** Examples

doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- on_slide( doc, index = 1)
doc <- ph_with_text(x = doc, type = "title", str = "First title")
doc <- on_slide( doc, index = 3)
doc <- ph_with_text(x = doc, type = "title", str = "Third title")

file <- tempfile(fileext = ".pptx")
print(doc, target = file )



