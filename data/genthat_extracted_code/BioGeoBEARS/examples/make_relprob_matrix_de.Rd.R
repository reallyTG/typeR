library(BioGeoBEARS)


### Name: make_relprob_matrix_de
### Title: Make a relative dispersal probability matrix (in text form)
### Aliases: make_relprob_matrix_de

### ** Examples

testval=1

states_list = list("_", c("A"), c("B"), c("C"), c
("A","B"), c("B","C"), c("A","C"), c("A","B","C"))

states_list = areas_list_to_states_list_new(
areas=c("A","B","C"), include_null_range=TRUE, split_ABC=TRUE)
states_list

dedf = make_relprob_matrix_de(states_list=states_list,
split_ABC=FALSE, split="", remove_simultaneous_events=TRUE,
add_multiple_Ds=TRUE,
dispersal_multiplier_matrix=make_dispersal_multiplier_matrix(states_list=states_list))

dedf



