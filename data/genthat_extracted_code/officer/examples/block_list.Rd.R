library(officer)


### Name: block_list
### Title: list of blocks
### Aliases: block_list

### ** Examples

img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
bl <- block_list(
  fpar(ftext("hello world", shortcuts$fp_bold())),
  fpar(
    ftext("hello", shortcuts$fp_bold()),
    stext(" world", "strong"),
    external_img(src = img.file, height = 1.06, width = 1.39)
  )
)



