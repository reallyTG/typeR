library(BioGeoBEARS)


### Name: make_relprob_txtmatrix_sp1
### Title: Convert a observed-speciation transition matrix to an
###   unobserved-speciation transition matrix (text version)
### Aliases: make_relprob_txtmatrix_sp1

### ** Examples

testval=1
probmat = make_relprob_matrix_bi(states_list=list("_", c("A"),
c("B"), c("C"), c("A","B"), c("B","C"), c("A","C"), c("A","B","C")),
split_ABC=FALSE, splitval="", code_for_overlapping_subsets=NA, printwarn=1)
probmat

newmat = make_relprob_txtmatrix_sp1(probmat=probmat, split="\\\\|")
newmat



