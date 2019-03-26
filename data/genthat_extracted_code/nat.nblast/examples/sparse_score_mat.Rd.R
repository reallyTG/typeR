library(nat.nblast)


### Name: sparse_score_mat
### Title: Convert a subset of a square score matrix to a sparse
###   representation
### Aliases: sparse_score_mat

### ** Examples

data(kcs20, package = "nat")
scores=nblast_allbyall(kcs20)
scores.3.sparse=sparse_score_mat(names(kcs20)[3], scores)
scores.3.sparse
# can also add additional submatrices
fill_in_sparse_score_mat(scores.3.sparse,scores[3:6,3:4])



