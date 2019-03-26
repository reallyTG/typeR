library(rdhs)


### Name: file_dataset_format
### Title: Returns what the dataset file ending should be for a given
###   filename
### Aliases: file_dataset_format

### ** Examples

file_format <- "Stata dataset (.dta)"
identical(rdhs:::file_dataset_format(file_format),"dta")




