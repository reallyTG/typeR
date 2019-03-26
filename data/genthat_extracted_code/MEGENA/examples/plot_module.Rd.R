library(MEGENA)


### Name: plot_module
### Title: Module plotting function.
### Aliases: plot_module

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
##D pnet.obj <- plot_module(output = output.summary,PFN = g,subset.module = "comp1_2",
##D 	layout = "kamada.kawai",label.hubs.only = FALSE,
##D 	gene.set = list("hub.set" = c("CD3E","CD2")),color.code =  c("red"),
##D 	output.plot = FALSE,out.dir = "modulePlot",col.names = c("grey","grey","grey"),
##D 	hubLabel.col = "black",hubLabel.sizeProp = 1,show.topn.hubs = Inf,show.legend = TRUE)
##D 	
##D pnet.obj
## End(Not run)



