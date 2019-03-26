library(MEGENA)


### Name: module_convert_to_table
### Title: conversion of module list object to a data.frame table format
### Aliases: module_convert_to_table

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
##D module.df = module_convert_to_table(MEGENA.output,mod.pval = 0.05,
##D hub.pval = 0.05,min.size = 10,max.size)
##D head(module.df)
## End(Not run)



