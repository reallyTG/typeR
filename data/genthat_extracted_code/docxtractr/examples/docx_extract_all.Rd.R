library(docxtractr)


### Name: docx_extract_all
### Title: Extract all tables from a Word document
### Aliases: docx_extract_all

### ** Examples

# a "real" Word doc

real_world <- read_docx(system.file("examples/realworld.docx", package="docxtractr"))
docx_tbl_count(real_world)

# get all the tables
tbls <- docx_extract_all_tbls(real_world)



