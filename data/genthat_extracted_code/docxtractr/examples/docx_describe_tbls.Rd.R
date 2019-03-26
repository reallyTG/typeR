library(docxtractr)


### Name: docx_describe_tbls
### Title: Returns a description of all the tables in the Word document
### Aliases: docx_describe_tbls

### ** Examples

complx <- read_docx(system.file("examples/complex.docx", package="docxtractr"))
docx_tbl_count(complx)
docx_describe_tbls(complx)



