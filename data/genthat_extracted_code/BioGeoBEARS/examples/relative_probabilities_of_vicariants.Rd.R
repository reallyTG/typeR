library(BioGeoBEARS)


### Name: relative_probabilities_of_vicariants
### Title: Calculate probability of different descendant rangesizes, for
###   the smaller descendant, in vicariant speciation
### Aliases: relative_probabilities_of_vicariants

### ** Examples

testval=1
# Examples

# Probabilities of different descendant rangesizes, for the smaller descendant,
# under sympatric/subset speciation
# (plus sympatric/range-copying, which is folded in):
relative_probabilities_of_subsets(max_numareas=6, maxent_constraint_01=0.0001,
NA_val=NA)
relative_probabilities_of_subsets(max_numareas=6, maxent_constraint_01=0.5,
NA_val=NA)
relative_probabilities_of_subsets(max_numareas=6, maxent_constraint_01=0.9999,
NA_val=NA)

# Probabilities of different descendant rangesizes, for the smaller descendant,
# under vicariant speciation
relative_probabilities_of_vicariants(max_numareas=6, maxent_constraint_01v=0.0001,
NA_val=NA)
relative_probabilities_of_vicariants(max_numareas=6, maxent_constraint_01v=0.5,
NA_val=NA)
relative_probabilities_of_vicariants(max_numareas=6, maxent_constraint_01v=0.9999,
NA_val=NA)



