library(CytobankAPI)


### Name: helper_functions
### Title: Helper Functions
### Aliases: helper_functions helper.filter_names_to_ids_from_df
###   helper.channel_ids_from_long_names

### ** Examples

## No test: 
helper.filter_names_to_ids_from_df(id_and_names_dataframe, names_list=c("CD.*", "Time", "pp38"))
## End(No test)
## No test: 
helper.channel_ids_from_long_names(panels.list(cyto_session, 22),
  long_channel_names=c("long_channel1", "long_channel2"), fcs_files=c(1,2,3,4,5))
## End(No test)



