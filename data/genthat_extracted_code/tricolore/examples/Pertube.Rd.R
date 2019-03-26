library(tricolore)


### Name: Pertube
### Title: Compositional Pertubation
### Aliases: Pertube
### Keywords: internal

### ** Examples

P <- prop.table(matrix(runif(12), 4), margin = 1)
cP <- tricolore:::Pertube(P, 1/tricolore:::Centre(P))
tricolore:::Centre(cP)




