library(officer)


### Name: ph_empty
### Title: add a new empty shape
### Aliases: ph_empty ph_empty_at

### ** Examples

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_empty(x = doc, type = "body", index = 1)
doc <- ph_empty(x = doc, location = ph_location_right())

print(doc, target = fileout )

# demo ph_empty_at ------
fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_empty_at(x = doc, left = 1, top = 2, width = 5, height = 4)

print(doc, target = fileout )



