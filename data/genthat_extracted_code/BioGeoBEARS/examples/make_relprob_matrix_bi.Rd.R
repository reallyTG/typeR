library(BioGeoBEARS)


### Name: make_relprob_matrix_bi
### Title: Make a relative probability matrix for a single speciation
###   (bifurcation) event
### Aliases: make_relprob_matrix_bi

### ** Examples

testval=1
probmat = make_relprob_matrix_bi(states_list=list("_",
c("A"), c("B"), c("C"), c("A","B"), c("B","C"), c("A","C"),
c("A","B","C")), split_ABC=FALSE, splitval="",
code_for_overlapping_subsets=NA, printwarn=1)
probmat



