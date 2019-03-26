library(MEGENA)


### Name: plot_module_hierarchy
### Title: Plot module hierarchy
### Aliases: plot_module_hierarchy

### ** Examples

## Not run: 
##D 	rm(list = ls())
##D 	data(Sample_Expression)
##D 	ijw <- calculate.correlation(datExpr,doPerm = 2)
##D 	el <- calculate.PFN(ijw[,1:3])
##D 	g <- graph.data.frame(el,directed = FALSE)
##D 	MEGENA.output <- do.MEGENA(g = g,remove.unsig = FALSE,doPar = FALSE,n.perm = 10)
##D 	output.summary <- MEGENA.ModuleSummary(MEGENA.output,
##D 	mod.pvalue = 0.05,hub.pvalue = 0.05,
##D 	min.size = 10,max.size = 5000,
##D 	annot.table = NULL,id.col = NULL,symbol.col = NULL,
##D 	output.sig = TRUE)
##D 
##D 	module.table = output.summary$module.table
##D 	colnames(module.table)[1] <- "id"
##D 	output.obj <- plot_module_hierarchy(module.table = module.table,
##D 	label.scaleFactor = 0.15,arrow.size = 0.005,node.label.color = "blue")
##D 
##D 	print(output.obj[[1]])
## End(Not run)



