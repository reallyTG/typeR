library(prozor)


### Name: greedy
### Title: given matrix (columns protein rows peptides), compute minimal
###   protein set using greedy algorithm
### Aliases: greedy

### ** Examples

library(prozor)

data(protpepmetashort)
colnames(protpepmetashort)
dim(unique(protpepmetashort[,4]))
xx = prepareMatrix(protpepmetashort, peptideID = "peptideModSeq")
dim(xx)
stopifnot(dim(xx)[1] == dim(unique(protpepmetashort[,4]))[1])
es = greedy(as.matrix(xx))
stopifnot(length(unique(names(es))) == dim(unique(protpepmetashort[,4]))[1])




