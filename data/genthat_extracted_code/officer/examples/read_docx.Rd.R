library(officer)


### Name: read_docx
### Title: open a connection to a 'Word' file
### Aliases: read_docx print.rdocx length.rdocx

### ** Examples

# create an rdocx object with default template ---
read_docx()

print(read_docx())
# write a rdocx object in a docx file ----
if( require(magrittr) ){
  read_docx() %>% print(target = tempfile(fileext = ".docx"))
}

# how many elements are there in the document ----
length( read_docx() )




