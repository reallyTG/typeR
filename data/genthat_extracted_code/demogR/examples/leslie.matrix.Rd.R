library(demogR)


### Name: leslie.matrix
### Title: Leslie Matrix
### Aliases: leslie.matrix
### Keywords: array algebra

### ** Examples


## Construct lx and mx values
data(goodman)
mlt <- with(goodman, life.table(x=age, nDx=mad.nDx, nKx=mad.nKx))
mx <- goodman$mad.bx/goodman$mad.nKx

## Now make the Leslie matrix
mad <- leslie.matrix(lx=mlt$nLx, mx=mx)

## Might as well do something with it too!
eigen.analysis(mad)



