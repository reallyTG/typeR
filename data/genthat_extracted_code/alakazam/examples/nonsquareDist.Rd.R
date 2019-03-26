library(alakazam)


### Name: nonsquareDist
### Title: Calculate pairwise distances between sequences
### Aliases: nonsquareDist

### ** Examples

# Gaps will be treated as Ns with a gap=0 distance matrix
seq <- c(A="ATGGC", B="ATGGG", C="ATGGG", D="AT--C")
pairwiseDist(seq, 
             dist_mat=getDNAMatrix(gap=0))

nonsquareDist(seq, indx=c(1,3), 
             dist_mat=getDNAMatrix(gap=0))




