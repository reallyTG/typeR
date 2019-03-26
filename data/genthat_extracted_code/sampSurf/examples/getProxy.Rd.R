library(sampSurf)


### Name: getProxy
### Title: Proxy functions for Monte Carlo sampling methods in 'sampSurf'
### Aliases: getProxy cmcProxy gvProxy wbProxy
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# retrieve a built-in proxy and use it...
#
sTree = standingTree(dbh = 40, topDiam = 0, height = 20, solidType = 2.8)
cmcFun = getProxy('cmcProxy')
( cmcFun(sTree, runif(4), c(0, sTree@height)) )



