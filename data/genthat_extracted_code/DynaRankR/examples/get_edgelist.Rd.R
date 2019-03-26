library(DynaRankR)


### Name: get_edgelist
### Title: Convert data from interaction matrix to edgelist
### Aliases: get_edgelist

### ** Examples

edges <- C.crocuta.female$interactions[C.crocuta.female$interactions$period == 1989,1:2]
ids <- C.crocuta.female$contestants[C.crocuta.female$contestants$period == 1989,'id']
mat <- edgelist_to_matrix(edgelist = edges, identities = ids)
get_edgelist(mat) 




