library(MEGENA)


### Name: draw_sunburst_wt_fill
### Title: Draw sunburst plot showing MEGENA module hierarchy.
### Aliases: draw_sunburst_wt_fill

### ** Examples

  ## Not run: 
##D     rm(list = ls())
##D     data(Sample_Expression)
##D     ijw <- calculate.correlation(datExpr[1:100,],doPerm = 2)
##D     el <- calculate.PFN(ijw[,1:3])
##D     g <- graph.data.frame(el,directed = FALSE)
##D     MEGENA.output <- do.MEGENA(g = g,remove.unsig = FALSE,doPar = FALSE,n.perm = 10)
##D     output.summary <- MEGENA.ModuleSummary(MEGENA.output,
##D     mod.pvalue = 0.05,hub.pvalue = 0.05,
##D     min.size = 10,max.size = 5000,
##D     annot.table = NULL,id.col = NULL,symbol.col = NULL,
##D     output.sig = TRUE)
##D     
##D     # no coloring 
##D     sbobj = draw_sunburst_wt_fill(module.df = output.summary$module.table,
##D     feat.col = NULL,id.col = "module.id",parent.col = "module.parent")
##D     sbobj
##D     
##D     # get some coloring (with log transform option)
##D     mdf= output.summary$module.table
##D     mdf$heat.pvalue = runif(nrow(mdf),0,0.1)
##D     
##D     sbobj = draw_sunburst_wt_fill(module.df = mdf,feat.col = "heat.pvalue",log.transform = TRUE,
##D     fill.type = "continuous",
##D     fill.scale = scale_fill_gradient2(low = "white",mid = "white",high = "red",
##D     midpoint = -log10(0.05),na.value = "white"), 
##D     id.col = "module.id",parent.col = "module.parent")
##D     sbobj
##D     
##D     # get discrete coloring done
##D     mdf$category = factor(sample(x = c("A","B"),size = nrow(mdf),replace = TRUE))
##D     sbobj = draw_sunburst_wt_fill(module.df = mdf,feat.col = "category",
##D     fill.type = "discrete",
##D     fill.scale = scale_fill_manual(values = c("A" = "red","B" = "blue")), 
##D     id.col = "module.id",parent.col = "module.parent")
##D     sbobj
##D   
## End(Not run)



