library(officer)


### Name: ph_with_ul
### Title: add unordered list to a pptx presentation
### Aliases: ph_with_ul

### ** Examples

library(magrittr)
pptx <- read_pptx()
pptx <- add_slide(x = pptx, layout = "Title and Content", master = "Office Theme")
pptx <- ph_with_text(x = pptx, type = "title", str = "Example title")
pptx <- ph_with_ul(
  x = pptx, location = ph_location_type(type="body"),
  str_list = c("Level1", "Level2", "Level2", "Level3", "Level3", "Level1"),
  level_list = c(1, 2, 2, 3, 3, 1),
  style = fp_text(color = "red", font.size = 0) )
print(pptx, target = tempfile(fileext = ".pptx"))



