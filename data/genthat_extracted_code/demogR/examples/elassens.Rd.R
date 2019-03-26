library(demogR)


### Name: elassens
### Title: elassens
### Aliases: elassens
### Keywords: array algebra

### ** Examples

data(goodman)
mlt <- with(goodman, life.table(x=age, nDx=mad.nDx, nKx=mad.nKx))
mx <- goodman$mad.bx/goodman$mad.nKx

##  make the Leslie matrix
mad <- leslie.matrix(lx=mlt$lx, mx=mx)

## now calculate the sensitivities of the elasticitities with respect
##to infant survival

es21 <- elassens(mad,2,1)



