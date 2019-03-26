library(docxtractr)


### Name: docx_extract_all_cmnts
### Title: Extract all comments from a Word document
### Aliases: docx_extract_all_cmnts

### ** Examples

cmnts <- read_docx(system.file("examples/comments.docx", package="docxtractr"))
docx_cmnt_count(cmnts)
docx_describe_cmnts(cmnts)
docx_extract_all_cmnts(cmnts)



