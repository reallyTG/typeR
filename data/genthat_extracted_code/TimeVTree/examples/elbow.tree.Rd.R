library(TimeVTree)


### Name: elbow.tree
### Title: Finding the Final Tree using the Elbow Method
### Aliases: elbow.tree

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
##D store.mult.cont <- bootstrap(B=20, nodetree, subtrees, alcohol[,'time'],
##D                                 alcohol[,'event'], x = alcohol[,'alc', drop = FALSE], 
##D                                 D=4,minfail=20, alphac=2)
##D                                 
##D Balph <- 0.5 * 2 * log(nrow(alcohol))                                
##D elbow.tree <- elbow.tree(nodetree, subtrees, store.mult.cont[[3]], alphac= Balph)
## End(Not run)



