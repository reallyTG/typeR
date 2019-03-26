library(officer)


### Name: ph_remove
### Title: remove shape
### Aliases: ph_remove

### ** Examples

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_text(x = doc, type = "title", str = "Un titre")
slide_summary(doc) # read column ph_label here
doc <- ph_remove(x = doc, ph_label = "Title 1")

print(doc, target = fileout )



