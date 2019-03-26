library(officer)


### Name: move_slide
### Title: move a slide
### Aliases: move_slide

### ** Examples

x <- read_pptx()
x <- add_slide(x, layout = "Title and Content",
  master = "Office Theme")
x <- ph_with_text(x, type = "body", str = "Hello world 1")
x <- add_slide(x, layout = "Title and Content",
  master = "Office Theme")
x <- ph_with_text(x, type = "body", str = "Hello world 2")
x <- move_slide(x, index = 1, to = 2)



