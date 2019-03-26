library(toxEval)


### Name: as.toxEval
### Title: toxEval helper functions
### Aliases: as.toxEval is.toxEvl

### ** Examples

path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
full_path <- file.path(path_to_tox, file_name)
tox_list <- create_toxEval(full_path)

# To over-ride one of the data frames:
chem_data <- data.frame(CAS = "21145-77-7",
                   Value = 1,
                   "Sample Date" = as.Date("2012-01-01"),
                   SiteID = "USGS-04249000")
tox_list_new <- as.toxEval(tox_list, chem_data)

path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
full_path <- file.path(path_to_tox, file_name)



