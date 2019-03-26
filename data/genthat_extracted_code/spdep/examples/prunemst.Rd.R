library(spdep)


### Name: prunemst
### Title: Prune a Minimun Spanning Tree
### Aliases: prunemst
### Keywords: tree cluster

### ** Examples

e <- matrix(c(2,3, 1,2, 3,4, 4,5), ncol=2, byrow=TRUE)
e
prunemst(e)
prunemst(e, only.nodes=FALSE)



