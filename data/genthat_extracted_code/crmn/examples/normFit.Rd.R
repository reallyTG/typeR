library(crmn)


### Name: normFit
### Title: Fit a normalization model
### Aliases: normFit

### ** Examples

data(mix)
nfit <- normFit(mix, "crmn", factors="type", ncomp=3)
slplot(sFit(nfit)$fit$pc, scol=as.integer(mix$runorder))
## same thing
Y <- exprs(mix)
G <- model.matrix(~-1+mix$type)
isIS <- fData(mix)$tag == 'IS'
nfit <- normFit(Y, "crmn", factors=G, ncomp=3, standards=isIS)
slplot(sFit(nfit)$fit$pc, scol=as.integer(mix$runorder))



