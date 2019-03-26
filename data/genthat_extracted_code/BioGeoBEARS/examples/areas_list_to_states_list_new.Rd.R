library(BioGeoBEARS)


### Name: areas_list_to_states_list_new
### Title: Convert a list of areas to a list of geographic ranges (states);
###   R version
### Aliases: areas_list_to_states_list_new

### ** Examples

areas = c("A","B","C")
areas_list_to_states_list_new(areas=areas, maxareas=length(areas),
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=length(areas),
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_new(areas=areas, maxareas=length(areas),
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=length(areas),
include_null_range=FALSE, split_ABC=FALSE)
areas_list_to_states_list_new(areas=areas, maxareas=2,
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=2,
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_new(areas=areas, maxareas=2,
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=2,
include_null_range=FALSE, split_ABC=FALSE)
areas_list_to_states_list_new(areas=areas, maxareas=1,
include_null_range=TRUE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=1,
include_null_range=TRUE, split_ABC=FALSE)
areas_list_to_states_list_new(areas=areas, maxareas=1,
include_null_range=FALSE, split_ABC=TRUE)
areas_list_to_states_list_new(areas=areas, maxareas=1,
include_null_range=FALSE, split_ABC=FALSE)



