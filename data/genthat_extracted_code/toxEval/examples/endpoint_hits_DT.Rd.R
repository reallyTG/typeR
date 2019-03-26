library(toxEval)


### Name: endpoint_hits_DT
### Title: Rank endpoints by category
### Aliases: endpoint_hits_DT endpoint_hits

### ** Examples

# This is the example workflow:
path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"

full_path <- file.path(path_to_tox, file_name)
## No test: 
tox_list <- create_toxEval(full_path)

ACC <- get_ACC(tox_list$chem_info$CAS)
ACC <- remove_flags(ACC)

cleaned_ep <- clean_endPoint_info(end_point_info)
filtered_ep <- filter_groups(cleaned_ep)
chemical_summary <- get_chemical_summary(tox_list, ACC, filtered_ep)

hits_df <- endpoint_hits(chemical_summary, category = "Biological")                        
endpoint_hits_DT(chemical_summary, category = "Biological")
endpoint_hits_DT(chemical_summary, category = "Chemical Class")
endpoint_hits_DT(chemical_summary, category = "Chemical")
## End(No test)



