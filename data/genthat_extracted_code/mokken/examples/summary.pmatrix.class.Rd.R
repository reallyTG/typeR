library(mokken)


### Name: summary.pmatrix.class
### Title: Summarize pmatrix.class objects
### Aliases: summary.pmatrix.class
### Keywords: summary pmatrix

### ** Examples

data(acl)
Communality <- acl[,1:10]
pmatrix.list <- check.pmatrix(Communality)
plot(pmatrix.list)
summary(pmatrix.list)

# Small example showing how to retrieve the P++ matrix and the P-- matrix
SmallExample <- acl[,1:4]
pmatrix.list <- check.pmatrix(SmallExample)
pmatrix.list$results$Ppp
pmatrix.list$results$Pmm



