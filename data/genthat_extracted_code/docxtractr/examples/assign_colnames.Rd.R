library(docxtractr)


### Name: assign_colnames
### Title: Make a specific row the column names for the specified
###   data.frame
### Aliases: assign_colnames

### ** Examples

# a "real" Word doc
real_world <- read_docx(system.file("examples/realworld.docx", package="docxtractr"))
docx_tbl_count(real_world)

# get all the tables
tbls <- docx_extract_all_tbls(real_world)

# make table 1 better
assign_colnames(tbls[[1]], 2)

# make table 5 better
assign_colnames(tbls[[5]], 2)



