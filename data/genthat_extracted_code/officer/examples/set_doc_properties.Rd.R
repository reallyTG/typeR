library(officer)


### Name: set_doc_properties
### Title: set document properties
### Aliases: set_doc_properties

### ** Examples

library(magrittr)
read_docx() %>% set_doc_properties(title = "title",
  subject = "document subject", creator = "Me me me",
  description = "this document is empty",
  created = Sys.time()) %>% doc_properties()



