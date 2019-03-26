library(MEGENA)


### Name: plot_subgraph
### Title: subnetwork plotting functionality.
### Aliases: plot_subgraph

### ** Examples

## Not run: 
##D rm(list = ls())
##D library(MEGENA)
##D 
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
##D 
##D pnet.obj <- plot_subgraph(module = output.summary$modules[[1]],
##D hub = c("CD3E","CD2"),PFN = g,node.default.color = "black",
##D gene.set = NULL,color.code = c("grey"),show.legend = TRUE,
##D label.hubs.only = TRUE,hubLabel.col = "red",hubLabel.sizeProp = 0.5,
##D show.topn.hubs = 10,node.sizeProp = 13,label.sizeProp = 13,
##D label.scaleFactor = 10,layout = "kamada.kawai")
##D 
##D # the plot	
##D pnet.obj[[1]]
##D 
##D # the annotation
##D pnet.obj[[2]]
## End(Not run)



