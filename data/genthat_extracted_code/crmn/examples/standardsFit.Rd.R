library(crmn)


### Name: standardsFit
### Title: Standards model
### Aliases: standardsFit

### ** Examples

data(mix)
sfit <- standardsFit(mix, "type", ncomp=3)
slplot(sfit$fit$pc)
## same thing
Y <- exprs(mix)
G <- model.matrix(~-1+mix$type)
isIS <- fData(mix)$tag == 'IS'
sfit <- standardsFit(Y, G, standards=isIS, ncomp=3)



