library(DynaRankR)


### Name: edgelist_to_matrix
### Title: Convert data from edgelist to interaction matrix
### Aliases: edgelist_to_matrix

### ** Examples

edges <- C.crocuta.female$interactions[C.crocuta.female$interactions$period == 1989,1:2]
ids <- C.crocuta.female$contestants[C.crocuta.female$contestants$period == 1989,'id']
edgelist_to_matrix(edgelist = edges, identities = ids)





