library(toxEval)


### Name: hits_by_groupings_DT
### Title: Biological hits per category
### Aliases: hits_by_groupings_DT hits_by_groupings

### ** Examples

# This is the example workflow:
path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"

full_path <- file.path(path_to_tox, file_name)

tox_list <- create_toxEval(full_path)

ACC <- get_ACC(tox_list$chem_info$CAS)
ACC <- remove_flags(ACC)

cleaned_ep <- clean_endPoint_info(end_point_info)
filtered_ep <- filter_groups(cleaned_ep)
chemical_summary <- get_chemical_summary(tox_list, ACC, filtered_ep)

site_df <- hits_by_groupings(chemical_summary, category = "Biological")

hits_by_groupings_DT(chemical_summary, category = "Biological")
hits_by_groupings_DT(chemical_summary, category = "Chemical Class")
hits_by_groupings_DT(chemical_summary, category = "Chemical")




