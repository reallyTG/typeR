library(BioGeoBEARS)


### Name: symbolic_cell_to_relprob_cell_sp
### Title: Convert symbolic cell (a text equation) to relprob cell (a
###   numeric value) - speciation matrix version
### Aliases: symbolic_cell_to_relprob_cell_sp

### ** Examples

testval=1

charcell = "y1"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=0, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "y1"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=1, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "j"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=0, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "j"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=1, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "v1_2"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=0, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "v1_2"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
 j=1, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "s1_2"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*", ys=1,
j=0, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(max_numareas=3,
maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(
max_numareas=3,
maxent_constraint_01v=0.0001))

charcell = "s1_2"
symbolic_cell_to_relprob_cell_sp(charcell, cellsplit="\\\\+", mergesym="*",
ys=1, j=1, v=1, relprob_subsets_matrix=relative_probabilities_of_subsets(
max_numareas=3, maxent_constraint_01=0.0001),
relprob_vicar_matrix=relative_probabilities_of_vicariants(
max_numareas=3,
maxent_constraint_01v=0.0001))



