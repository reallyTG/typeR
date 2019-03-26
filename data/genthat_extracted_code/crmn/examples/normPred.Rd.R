library(crmn)


### Name: normPred
### Title: Predict for normalization
### Aliases: normPred

### ** Examples

data(mix)
nfit <- normFit(mix, "crmn", factor="type", ncomp=3)
normedData <- normPred(nfit, mix, "type")
slplot(pca(t(log2(exprs(normedData)))), scol=as.integer(mix$type))
## same thing
Y <- exprs(mix)
G <- with(pData(mix), model.matrix(~-1+type))
isIS <- fData(mix)$tag == 'IS'
nfit <- normFit(Y, "crmn", factors=G, ncomp=3, standards=isIS)
normedData <- normPred(nfit, Y, G, standards=isIS)
slplot(pca(t(log2(normedData))), scol=as.integer(mix$type))



