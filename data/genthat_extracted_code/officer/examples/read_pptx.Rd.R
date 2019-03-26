library(officer)


### Name: read_pptx
### Title: open a connexion to a 'PowerPoint' file
### Aliases: read_pptx print.rpptx length.rpptx slide_size

### ** Examples

read_pptx()
# write a rdocx object in a docx file ----
if( require(magrittr) ){
  file <- tempfile(fileext = ".pptx")
  read_pptx() %>% print(target = file)
  # full path of produced file is returned
  print(.Last.value)
}



