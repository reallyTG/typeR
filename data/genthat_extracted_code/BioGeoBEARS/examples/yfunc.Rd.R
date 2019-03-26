library(BioGeoBEARS)


### Name: yfunc
### Title: Extract the appropriate probability for a
###   sympatric/range-copying speciation event, given text code for
###   rangesize of smaller descendant, and ancestor
### Aliases: yfunc

### ** Examples

testval=1
# Examples

# Probabilities of different descendant rangesizes, for the smaller
# descendant, under sympatric/subset speciation
# (plus sympatric/range-copying, which is folded in):
relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.0001, NA_val=NA)
relprob_subsets_matrix
sfunc(charcell="s1_1", relprob_subsets_matrix)
sfunc(charcell="s1_2", relprob_subsets_matrix)
sfunc(charcell="s1_3", relprob_subsets_matrix)
sfunc(charcell="s2_3", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.5, NA_val=NA)
relprob_subsets_matrix
sfunc(charcell="s1_1", relprob_subsets_matrix)
sfunc(charcell="s1_2", relprob_subsets_matrix)
sfunc(charcell="s1_3", relprob_subsets_matrix)
sfunc(charcell="s2_3", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.9999, NA_val=NA)
relprob_subsets_matrix
sfunc(charcell="s1_1", relprob_subsets_matrix)
sfunc(charcell="s1_2", relprob_subsets_matrix)
sfunc(charcell="s1_3", relprob_subsets_matrix)
sfunc(charcell="s2_3", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.0001, NA_val=NA)
relprob_subsets_matrix
yfunc(charcell="y1", relprob_subsets_matrix)
yfunc(charcell="y2", relprob_subsets_matrix)
yfunc(charcell="y3", relprob_subsets_matrix)
yfunc(charcell="y4", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.5, NA_val=NA)
relprob_subsets_matrix
yfunc(charcell="y1", relprob_subsets_matrix)
yfunc(charcell="y2", relprob_subsets_matrix)
yfunc(charcell="y3", relprob_subsets_matrix)
yfunc(charcell="y4", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_subsets(max_numareas=6,
maxent_constraint_01=0.9999, NA_val=NA)
relprob_subsets_matrix
yfunc(charcell="y1", relprob_subsets_matrix)
yfunc(charcell="y2", relprob_subsets_matrix)
yfunc(charcell="y3", relprob_subsets_matrix)
yfunc(charcell="y4", relprob_subsets_matrix)


# Probabilities of different descendant rangesizes, for the smaller descendant,
# under vicariant speciation
relprob_subsets_matrix = relative_probabilities_of_vicariants(max_numareas=6,
maxent_constraint_01v=0.0001, NA_val=NA)
relprob_subsets_matrix
vfunc(charcell="v1_1", relprob_subsets_matrix)
vfunc(charcell="v1_2", relprob_subsets_matrix)
vfunc(charcell="v1_3", relprob_subsets_matrix)
vfunc(charcell="v1_4", relprob_subsets_matrix)
vfunc(charcell="v2_4", relprob_subsets_matrix)
vfunc(charcell="v2_2", relprob_subsets_matrix)
vfunc(charcell="v1_6", relprob_subsets_matrix)
vfunc(charcell="v2_6", relprob_subsets_matrix)
vfunc(charcell="v3_6", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_vicariants(max_numareas=6,
maxent_constraint_01v=0.5, NA_val=NA)
relprob_subsets_matrix
vfunc(charcell="v1_1", relprob_subsets_matrix)
vfunc(charcell="v1_2", relprob_subsets_matrix)
vfunc(charcell="v1_3", relprob_subsets_matrix)
vfunc(charcell="v1_4", relprob_subsets_matrix)
vfunc(charcell="v2_4", relprob_subsets_matrix)
vfunc(charcell="v2_2", relprob_subsets_matrix)
vfunc(charcell="v1_6", relprob_subsets_matrix)
vfunc(charcell="v2_6", relprob_subsets_matrix)
vfunc(charcell="v3_6", relprob_subsets_matrix)

relprob_subsets_matrix = relative_probabilities_of_vicariants(max_numareas=6,
maxent_constraint_01v=0.9999, NA_val=NA)
relprob_subsets_matrix
vfunc(charcell="v1_1", relprob_subsets_matrix)
vfunc(charcell="v1_2", relprob_subsets_matrix)
vfunc(charcell="v1_3", relprob_subsets_matrix)
vfunc(charcell="v1_4", relprob_subsets_matrix)
vfunc(charcell="v2_4", relprob_subsets_matrix)
vfunc(charcell="v2_2", relprob_subsets_matrix)
vfunc(charcell="v1_6", relprob_subsets_matrix)
vfunc(charcell="v2_6", relprob_subsets_matrix)
vfunc(charcell="v3_6", relprob_subsets_matrix)



