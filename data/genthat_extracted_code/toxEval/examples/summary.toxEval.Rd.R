library(toxEval)


### Name: summary.toxEval
### Title: Summary of tox_list
### Aliases: summary.toxEval

### ** Examples

path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
excel_file_path <- file.path(path_to_tox, file_name)
tox_list <- create_toxEval(excel_file_path)
summary(tox_list) 



