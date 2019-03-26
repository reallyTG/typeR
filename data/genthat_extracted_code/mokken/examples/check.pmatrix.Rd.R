library(mokken)


### Name: check.pmatrix
### Title: Check of Nonintersection Using Method Pmatrix
### Aliases: check.pmatrix
### Keywords: pmatrix

### ** Examples

data(acl)
Communality <- acl[,1:10]
pmatrix.list <- check.pmatrix(Communality)
plot(pmatrix.list)
summary(pmatrix.list)



