library(BioGeoBEARS)


### Name: tipranges_to_tip_condlikes_of_data_on_each_state
### Title: Convert a tipranges object to the tip likelihoods
### Aliases: tipranges_to_tip_condlikes_of_data_on_each_state

### ** Examples

testval=1
# Define a tipranges object
tipranges_object = define_tipranges_object()
tipranges_object

areanames = getareas_from_tipranges_object(tipranges_object)
areanames

# Specify phylogeny to go with default tipranges object
newick_str = "((tip1:1,tip2:1):1,tip3:2):1;"
phy = read.tree(file="", text=newick_str)

# Here, we will assume the maximum range size is all areas, but it could be smaller
maxareas = length(areanames)
## Not run: 
##D states_list = areas_list_to_states_list_old(areas=areanames, include_null_range=TRUE,
##D maxareas=maxareas)
##D states_list
## End(Not run)

states_list = areas_list_to_states_list_new(areas=areanames, include_null_range=TRUE,
maxareas=maxareas)
states_list

tip_condlikes_of_data_on_each_state = tipranges_to_tip_condlikes_of_data_on_each_state(
tipranges=tipranges_object, phy=phy, states_list=states_list, maxareas=maxareas )
tip_condlikes_of_data_on_each_state



