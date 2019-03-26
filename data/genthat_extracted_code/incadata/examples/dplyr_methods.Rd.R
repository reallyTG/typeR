library(incadata)


### Name: dplyr_methods
### Title: dplyr methods for INCA data
### Aliases: dplyr_methods filter.incadata mutate.incadata arrange.incadata
###   rename.incadata select.incadata slice.incadata summarise.incadata
###   summarize.incadata group_by.incadata
### Keywords: internal

### ** Examples

x <- dplyr::slice(as.incadata(incadata::ex_data), 1:10)
class(x) # "incadata"   "tbl_df"     "tbl"        "data.frame"




