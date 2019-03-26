library(BioGeoBEARS)


### Name: divide_probs_by_number_of_options_nums
### Title: Divide each type of event by its frequency, return calculated
###   probabilities
### Aliases: divide_probs_by_number_of_options_nums

### ** Examples

testval=1
spmat = make_relprob_matrix_bi()
spmat

spmat1 = divide_probs_by_number_of_options_txt(spmat)
spmat1


probmat = spmat
spPmat = symbolic_to_relprob_matrix_sp(spmat, cellsplit="\\+",
mergesym="*", ys=1, j=0, v=1, maxent_constraint_01=0.0001,
maxent_constraint_01v=0.0001, max_numareas=3)
spPmat
probmat2 = divide_probs_by_number_of_options_nums(spPmat, probmat)
probmat2

probmat = spmat1
spPmat = symbolic_to_relprob_matrix_sp(spmat, cellsplit="\\+",
mergesym="*", ys=1, j=0, v=1, maxent_constraint_01=0.0001,
maxent_constraint_01v=0.0001, max_numareas=3)
spPmat
probmat3 = divide_probs_by_number_of_options_nums(spPmat, probmat)
probmat3



