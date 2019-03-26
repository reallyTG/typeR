library(rvg)


### Name: ph_with_vg
### Title: add a plot output as vector graphics into a PowerPoint object
### Aliases: ph_with_vg ph_with_vg_at

### ** Examples

## No test: 
library(officer)
doc <- read_pptx()
doc <- add_slide(doc, "Title and Content", "Office Theme")
doc <- ph_with_vg(doc, code = barplot(1:5, col = 2:6), type = "body")
doc <- add_slide(doc, "Title and Content", "Office Theme")
doc <- ph_with_vg_at(doc, code = barplot(1:5, col = 2:6),
  left = 1, top = 2, width = 6, height = 4)
print(doc, target = "vg.pptx")
## End(No test)



