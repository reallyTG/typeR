library(toxEval)


### Name: plot_tox_stacks
### Title: Plot stacked bar charts
### Aliases: plot_tox_stacks

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
                                       
plot_tox_stacks(chemical_summary, tox_list$chem_site, "Biological")   
plot_tox_stacks(chemical_summary, tox_list$chem_site, "Chemical Class")
plot_tox_stacks(chemical_summary, tox_list$chem_site, "Chemical", include_legend = FALSE) 




