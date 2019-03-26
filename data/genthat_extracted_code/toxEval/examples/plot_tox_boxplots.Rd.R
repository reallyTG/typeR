library(toxEval)


### Name: graph_chem_data
### Title: Grouped Boxplots
### Aliases: graph_chem_data plot_tox_boxplots tox_boxplot_data

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
plot_tox_boxplots(chemical_summary, "Biological")   
plot_tox_boxplots(chemical_summary, "Chemical Class")
plot_tox_boxplots(chemical_summary, "Chemical")


cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", 
               "#0072B2", "#D55E00", "#CC79A7")
graphData <- tox_boxplot_data(chemical_summary = chemical_summary,
                              category = "Biological") 
cbValues <- colorRampPalette(cbPalette)(length(levels(graphData$category)))
names(cbValues) <- levels(graphData$category)

plot_tox_boxplots(chemical_summary, 
                  hit_threshold = 0.1,
                  category = "Biological",
                  palette = cbValues,
                  title = 'Maximum EAR per site, grouped by biological activity groupings') 




