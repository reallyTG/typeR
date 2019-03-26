library(BioGeoBEARS)


### Name: make_relprob_nummatrix_sp1
### Title: Convert a observed-speciation transition matrix to an
###   unobserved-speciation transition matrix (numeric version)
### Aliases: make_relprob_nummatrix_sp1

### ** Examples

testval=1
spmat = make_relprob_matrix_bi(states_list=list("_", c("A"),
c("B"), c("C"), c("A","B"), c("B","C"), c("A","C"), c("A","B","C")),
split_ABC=FALSE, splitval="", code_for_overlapping_subsets=NA, printwarn=1)
spmat

spPmat = symbolic_to_relprob_matrix_sp(spmat, cellsplit="\\\\+",
mergesym="*", ys=1, j=0, v=1, maxent_constraint_01=0.0001,
maxent_constraint_01v=0.0001, max_numareas=3)
spPmat

newmat = make_relprob_nummatrix_sp1(probmat=spmat, spPmat=spPmat, split="\\\\|")
newmat



