library(BioGeoBEARS)


### Name: paste_rows_without_zeros
### Title: Concatenate cells in each row of a text-based transition matrix,
###   excluding zeros
### Aliases: paste_rows_without_zeros

### ** Examples

testval=1

spmat = make_relprob_matrix_bi(states_list=list("_", c("A"),
c("B"), c("C"), c("A","B"), c("B","C"), c("A","C"), c("A","B","C")),
split_ABC=FALSE, splitval="", code_for_overlapping_subsets=NA, printwarn=1)
spmat
tmpcol = paste_rows_without_zeros(tmpmat=spmat)
tmpcol



