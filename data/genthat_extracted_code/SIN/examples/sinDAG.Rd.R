library(SIN)


### Name: sinDAG
### Title: SIN for acyclic directed graphs
### Aliases: sinDAG
### Keywords: multivariate

### ** Examples

data(fowlbones)
p <- dim(fowlbones$corr)[1]
sinDAG(list(1:p),fowlbones$corr,fowlbones$n)
sinDAG(list(1:p),fowlbones$corr,fowlbones$n,holm=FALSE)
sinDAG(list(3,2,1,4,5,6),fowlbones$corr,fowlbones$n)



