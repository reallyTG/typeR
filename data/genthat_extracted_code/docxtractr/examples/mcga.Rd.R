library(docxtractr)


### Name: mcga
### Title: Make Column Names Great Again
### Aliases: mcga

### ** Examples

real_world <- read_docx(system.file("examples/realworld.docx", package="docxtractr"))
tbls <- docx_extract_all_tbls(real_world)
mcga(assign_colnames(tbls[[1]], 2))



