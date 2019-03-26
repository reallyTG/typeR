library(MEGENA)


### Name: MEGENA.ModuleSummary
### Title: MEGENA module summary
### Aliases: MEGENA.ModuleSummary

### ** Examples

## Not run: 
##D rm(list = ls())
##D data(Sample_Expression)
##D ijw <- calculate.correlation(datExpr[1:100,],doPerm = 2)
##D el <- calculate.PFN(ijw[,1:3])
##D g <- graph.data.frame(el,directed = FALSE)
##D MEGENA.output <- do.MEGENA(g = g,remove.unsig = FALSE,doPar = FALSE,n.perm = 10)
##D output.summary <- MEGENA.ModuleSummary(MEGENA.output,
##D mod.pvalue = 0.05,hub.pvalue = 0.05,
##D min.size = 10,max.size = 5000,
##D annot.table = NULL,id.col = NULL,symbol.col = NULL,
##D output.sig = TRUE)
## End(Not run)



