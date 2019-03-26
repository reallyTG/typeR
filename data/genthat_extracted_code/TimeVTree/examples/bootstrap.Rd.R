library(TimeVTree)


### Name: bootstrap
### Title: Bootstrap to Correct for Over-optimism due to Adaptive Splitting
### Aliases: bootstrap boot.coxfit free

### ** Examples

## Not run: 
##D data('alcohol')
##D require(survival)
##D 
##D coxtree <- coxph.tree(alcohol[,'time'], alcohol[,'event'], 
##D                       x = alcohol[,'alc', drop = FALSE], D = 4)
##D nodetree <- output.coxphout(coxtree)
##D 
##D subtrees <- prune(nodetree)
##D 
##D #This function requires output from output.coxphout, prune, and the original data set.
##D 
##D store.mult.cont <- bootstrap(B=20, nodetree, subtrees, alcohol[,'time'],
##D                                 alcohol[,'event'], x = alcohol[,'alc', drop = FALSE], 
##D                                 D=4,minfail=20, alphac=2)
## End(Not run)



