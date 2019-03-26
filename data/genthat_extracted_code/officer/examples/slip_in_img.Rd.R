library(officer)


### Name: slip_in_img
### Title: append an image
### Aliases: slip_in_img

### ** Examples

library(magrittr)
img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
x <- read_docx() %>%
  body_add_par("R logo: ", style = "Normal") %>%
  slip_in_img(src = img.file, style = "strong", width = .3, height = .3)

print(x, target = tempfile(fileext = ".docx"))



