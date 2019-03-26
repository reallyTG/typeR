library(cladoRcpp)


### Name: areas_list_to_states_list_old
### Title: Convert a list of areas to a list of geographic ranges (states);
###   original R version
### Aliases: areas_list_to_states_list_old

### ** Examples

areas = c("A","B","C")
areas_list_to_states_list_old(areas=areas, maxareas=length(areas), 
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=length(areas), 
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_old(areas=areas, maxareas=length(areas), 
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=length(areas), 
include_null_range=FALSE, split_ABC=FALSE)
areas_list_to_states_list_old(areas=areas, maxareas=2, 
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=2, 
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_old(areas=areas, maxareas=2, 
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=2, 
include_null_range=FALSE, split_ABC=FALSE)
areas_list_to_states_list_old(areas=areas, maxareas=1, 
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=1, 
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_old(areas=areas, maxareas=1, 
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_old(areas=areas, maxareas=1, 
include_null_range=FALSE, split_ABC=FALSE)




