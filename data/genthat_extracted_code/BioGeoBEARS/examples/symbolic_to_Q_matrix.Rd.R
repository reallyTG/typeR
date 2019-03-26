library(BioGeoBEARS)


### Name: symbolic_to_Q_matrix
### Title: Convert symbolic matrix to an instantaneous rate matrix (Q
###   matrix)
### Aliases: symbolic_to_Q_matrix

### ** Examples

testval=1

states_list = list("_", c("A"), c("B"), c("C"), c("A","B"),
c("B","C"), c("A","C"), c("A","B","C"))

states_list = areas_list_to_states_list_new(areas=c("A","B","C"),
include_null_range=TRUE, split_ABC=TRUE)
states_list

dedf = make_relprob_matrix_de(states_list=states_list, split_ABC=FALSE,
split="", remove_simultaneous_events=TRUE, add_multiple_Ds=TRUE,
dispersal_multiplier_matrix=make_dispersal_multiplier_matrix(states_list=states_list))
dedf

# Right
Qmat = symbolic_to_Q_matrix(dedf, cellsplit="\\\\+", mergesym="+", d=0.1, e=0.01)
Qmat

# Wrong
Qmat = symbolic_to_Q_matrix(dedf, cellsplit="\\\\+", mergesym="*", d=0.1, e=0.01)
Qmat

# You don't have to split, if the formulas are directly parsable
Qmat = symbolic_to_Q_matrix(dedf, cellsplit="yadda", mergesym="", d=0.1, e=0.01)
Qmat



