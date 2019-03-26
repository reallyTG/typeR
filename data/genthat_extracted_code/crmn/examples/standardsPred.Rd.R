library(crmn)


### Name: standardsPred
### Title: Predict effect for new data (or get fitted data)
### Aliases: standardsPred

### ** Examples

data(mix)
fullFit <- standardsFit(mix, "type", ncomp=3)
sfit <- standardsFit(mix[,-1], "type", ncomp=3)
pred <- standardsPred(sfit, mix[,1], "type")
cor(scores(sfit$fit$pc)[1,], scores(fullFit$fit$pc)[1,])
## could just as well have been done as
Y <- exprs(mix)
G <- model.matrix(~-1+mix$type)
isIS <- fData(mix)$tag == 'IS'
fullFit <- standardsFit(Y, G, ncomp=3, standards=isIS)
sfit    <- standardsFit(Y[,-1], G[-1,], ncomp=3,
                        standards=isIS)
pred <- standardsPred(sfit, Y[,1,drop=FALSE], G[1,,drop=FALSE], standards=isIS)
cor(scores(sfit$fit$pc)[1,], scores(fullFit$fit$pc)[1,])



