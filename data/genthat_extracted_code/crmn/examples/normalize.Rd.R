library(crmn)


### Name: normalize
### Title: Normalize a metabolomics dataset
### Aliases: normalize

### ** Examples

data(mix)
normalize(mix, "crmn", factor="type", ncomp=3)
#other methods
normalize(mix, "one")
normalize(mix, "avg")
normalize(mix, "nomis")
normalize(mix, "t1")
normalize(mix, "ri")
normalize(mix, "median")
normalize(mix, "totL2")
## can also do normalization with matrices
Y <- exprs(mix)
G <- with(pData(mix), model.matrix(~-1+type))
isIS <- with(fData(mix), tag == "IS")
normalize(Y, "crmn", factor=G, ncomp=3, standards=isIS)



