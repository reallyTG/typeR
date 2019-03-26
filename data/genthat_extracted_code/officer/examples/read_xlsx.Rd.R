library(officer)


### Name: read_xlsx
### Title: open a connexion to an 'Excel' file
### Aliases: read_xlsx length.rxlsx print.rxlsx

### ** Examples

read_xlsx()
# write a rdocx object in a docx file ----
if( require(magrittr) ){
  read_xlsx() %>% print(target = tempfile(fileext = ".xlsx"))
  # full path of produced file is returned
  print(.Last.value)
}



