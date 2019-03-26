library(geneplotter)


### Name: plotExpressionGraph
### Title: A function to plot a graph colored by expression data
### Aliases: plotExpressionGraph getPlotExpressionColors IMCAEntrezLink
###   defMapFun
### Keywords: utilities graphs hplot

### ** Examples

   if (require("Rgraphviz") && require("hgu95av2.db") &&
       require("fibroEset")) {
       data(integrinMediatedCellAdhesion)
	   data(IMCAEntrezLink)
       data(fibroEset)
       attrs <- getDefaultAttrs()
       attrs$graph$rankdir <- "LR"
       plotExpressionGraph(IMCAGraph, IMCAEntrezLink,
                           exprs(fibroEset)[,1],
                           hgu95av2ENTREZID, attrs = attrs)
   }



