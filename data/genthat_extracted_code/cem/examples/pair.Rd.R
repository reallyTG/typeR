library(cem)


### Name: pair
### Title: Produces a paired sample out of a CEM match solution
### Aliases: pair
### Keywords: multivariate datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D # cem match: automatic bin choice
##D mat <- cem(data=LL, drop="re78")
##D 
##D # we want a set of paired units
##D psample <- pair(mat, data=LL)
##D table(psample$paired)
##D psample$paired[1:100]
##D 
##D table(psample$full.paired)
##D psample$full.paired[1:10]
##D 
##D 
##D 
##D # cem match: automatic bin choice, we drop one row from the data set
##D mat1 <- cem(data=LL[-1,], drop="re78")
##D 
##D # we want a set of paired units but we have an odd number of units in the data
##D psample <- pair(mat1, data=LL[-1,])
##D table(psample$full.paired)
## End(Not run)



