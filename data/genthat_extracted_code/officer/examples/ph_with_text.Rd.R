library(officer)


### Name: ph_with_text
### Title: add text into a new shape
### Aliases: ph_with_text

### ** Examples

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_text(x = doc, type = "title", str = "Un titre")
doc <- ph_with_text(x = doc, type = "ftr", str = "pied de page")
doc <- ph_with_text(x = doc, type = "dt", str = format(Sys.Date()))
doc <- ph_with_text(x = doc, type = "sldNum", str = "slide 1")

doc <- add_slide(doc, layout = "Title Slide", master = "Office Theme")
doc <- ph_with_text(x = doc, type = "subTitle", str = "Un sous titre")
doc <- ph_with_text(x = doc, type = "ctrTitle", str = "Un titre")

print(doc, target = fileout )



