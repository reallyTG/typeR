library(mokken)


### Name: plot.pmatrix.class
### Title: Plot pmatrix.class objects
### Aliases: plot.pmatrix.class
### Keywords: plot pmatrix

### ** Examples

data(acl)
Communality <- acl[,1:10]
pmatrix.list <- check.pmatrix(Communality)
plot(pmatrix.list)
summary(pmatrix.list)



