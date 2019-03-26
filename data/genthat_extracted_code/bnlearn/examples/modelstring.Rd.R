library(bnlearn)


### Name: model string utilities
### Title: Build a model string from a Bayesian network and vice versa
### Aliases: 'model string utilities' modelstring modelstring<-
###   model2network as.character.bn as.bn as.bn.character
### Keywords: convenience functions

### ** Examples

data(learning.test)
res = set.arc(gs(learning.test), "A", "B")
res
modelstring(res)
res2 = model2network(modelstring(res))
res2
all.equal(res, res2)



