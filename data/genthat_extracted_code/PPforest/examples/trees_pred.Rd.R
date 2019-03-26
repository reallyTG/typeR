library(PPforest)


### Name: trees_pred
### Title: Obtain predicted class for new data from baggtree function or
###   PPforest
### Aliases: trees_pred

### ** Examples

## Not run: 
##D crab.trees <- baggtree(data = crab, class = 'Type', 
##D m =  200, PPmethod = 'LDA', lambda = .1, size.p = 0.4 )
##D  
##D pr <- trees_pred(  crab.trees,xnew = crab[, -1], parallel= FALSE, cores=2)
##D 
##D pprf.crab <- PPforest(data = crab, class = 'Type',
##D  std = FALSE, size.tr = 2/3, m = 100, size.p = .4, PPmethod = 'LDA', parallel = TRUE )
##D  
##D trees_pred(pprf.crab, xnew = pprf.crab$test ,paralle = TRUE)
## End(Not run)



