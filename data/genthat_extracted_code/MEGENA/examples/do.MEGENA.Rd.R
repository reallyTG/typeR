library(MEGENA)


### Name: do.MEGENA
### Title: MEGENA clustering + MHA
### Aliases: do.MEGENA

### ** Examples

## Not run: 
##D rm(list = ls())
##D data(Sample_Expression)
##D ijw <- calculate.correlation(datExpr[1:100,],doPerm = 2)
##D el <- calculate.PFN(ijw[,1:3])
##D g <- graph.data.frame(el,directed = FALSE)
##D MEGENA.output <- do.MEGENA(g = g,remove.unsig = FALSE,doPar = FALSE,n.perm = 10)
## End(Not run)



