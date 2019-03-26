library(toxEval)


### Name: create_toxEval
### Title: Load and check toxEval data
### Aliases: create_toxEval

### ** Examples

path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
excel_file_path <- file.path(path_to_tox, file_name)
tox_list <- create_toxEval(excel_file_path)



