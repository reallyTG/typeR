library(polymapR)


### Name: marker_binning_list
### Title: Bin markers that are in a nested list
### Aliases: marker_binning_list

### ** Examples

data("screened_data3", "all_linkages_list_P1_split")
mb<-marker_binning_list(screened_data3,
                     all_linkages_list_P1_split,
                     target_parent="P1",
                     other_parent="P2")



