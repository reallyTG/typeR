library(BioGeoBEARS)


### Name: symbolic_to_P_matrix
### Title: Convert symbolic matrix to relprob matrix
### Aliases: symbolic_to_P_matrix

### ** Examples

testval=1

states_list = list("_", c("A"), c("B"), c("C"), c("A","B"),
c("B","C"), c("A","C"), c("A","B","C"))

states_list = areas_list_to_states_list_new(areas=c("A","B","C"),
include_null_range=TRUE, split_ABC=TRUE)
states_list

dedf = make_relprob_matrix_de(states_list=states_list,
 split_ABC=FALSE, split="", remove_simultaneous_events=TRUE,
add_multiple_Ds=TRUE,
dispersal_multiplier_matrix=make_dispersal_multiplier_matrix(states_list=states_list))
dedf

# Defaults
Pmat = symbolic_to_P_matrix(dedf, cellsplit="\\\\+", mergesym="+",
diags_sum_to_1=FALSE, d=0.1, e=0.01)
Pmat

# Calculate diagonal
Pmat = symbolic_to_P_matrix(dedf, cellsplit="\\\\+", mergesym="+",
diags_sum_to_1=TRUE, d=0.1, e=0.01)
Pmat

# You don't have to split, if the formulas are directly parsable
Pmat = symbolic_to_P_matrix(dedf, cellsplit="yadda", mergesym="",
diags_sum_to_1=FALSE, d=0.1, e=0.01)
Pmat



