library(MEGENA)


### Name: get.union.cut
### Title: Scale-thresholding of multiscale modules.
### Aliases: get.union.cut

### ** Examples

## Not run: 
##D rm(list = ls())
##D data(Sample_Expression)
##D ijw <- calculate.correlation(datExpr[1:100,],doPerm = 2)
##D el <- calculate.PFN(ijw[,1:3])
##D g <- graph.data.frame(el,directed = FALSE)
##D MEGENA.output <- do.MEGENA(g = g,remove.unsig = FALSE,doPar = FALSE,n.perm = 10)
##D get.union.cut(module.output = MEGENA.output$module.output,alpha.cut = 1,
##D output.plot = FALSE,plotfname = NULL,module.pval = 0.05,remove.unsig = TRUE)
## End(Not run)



