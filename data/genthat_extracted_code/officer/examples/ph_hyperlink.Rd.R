library(officer)


### Name: ph_hyperlink
### Title: hyperlink a placeholder
### Aliases: ph_hyperlink

### ** Examples

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_text(x = doc, type = "title", str = "Un titre 1")
slide_summary(doc) # read column ph_label here
doc <- ph_hyperlink(x = doc, ph_label = "Title 1",
  href = "https://cran.r-project.org")

print(doc, target = fileout )



