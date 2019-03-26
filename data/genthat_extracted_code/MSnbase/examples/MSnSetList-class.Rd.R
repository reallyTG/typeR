library(MSnbase)


### Name: MSnSetList-class
### Title: Storing multiple related MSnSets
### Aliases: MSnSetList-class MSnSetList msnsets objlog
###   [,MSnSetList,ANY,ANY,ANY-method
###   [,MSnSetList,ANY,missing,missing-method [[,MSnSetList,ANY,ANY-method
###   [[,MSnSetList,ANY,missing-method length,MSnSetList-method
###   show,MSnSetList-method names,MSnSetList-method
###   names<-,MSnSetList,ANY-method split,MSnSet,factor-method
###   split,MSnSet,character-method unsplit,MSnSetList,factor-method
###   lapply,MSnSetList-method sapply,MSnSetList-method
###   fData,MSnSetList-method fData<-,MSnSetList,DataFrame-method
### Keywords: classes

### ** Examples

library("pRolocdata")
data(tan2009r1)
data(tan2009r2)

## The MSnSetList class
##  for an unnamed list, names are set to indices
msnl <- MSnSetList(list(tan2009r1, tan2009r2))
names(msnl)
##  a named example
msnl <- MSnSetList(list(A = tan2009r1, B = tan2009r2))
names(msnl)
msnsets(msnl)
length(msnl)
objlog(msnl)
msnl[[1]] ## an MSnSet
msnl[1]   ## an MSnSetList of length 1

## Iterating over the elements
lapply(msnl, dim) ## a list
lapply(msnl, normalise) ## an MSnSetList

fData(msnl)
fData(msnl)$X <- sapply(msnl, nrow)
fData(msnl)

## Splitting and unsplitting
##  splitting along the columns/samples
data(dunkley2006)
head(pData(dunkley2006))
(splt <- split(dunkley2006, "replicate"))
lapply(splt, dim) ## the number of rows and columns of the split elements
unsplt <- unsplit(splt, dunkley2006$replicate)
stopifnot(compareMSnSets(dunkley2006, unsplt))

##  splitting along the rows/features
head(fData(dunkley2006))
(splt <- split(dunkley2006, "markers"))
unsplt <- unsplit(splt, factor(fData(dunkley2006)$markers))
simplify2array(lapply(splt, dim))
stopifnot(compareMSnSets(dunkley2006, unsplt))




