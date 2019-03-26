library(ACSNMineR)


### Name: enrichment
### Title: Gene set enrichment analysis
### Aliases: enrichment

### ** Examples

enrichment(genes_test,min_module_size = 10, 
   threshold = 0.05,
   maps = list(cellcycle = ACSNMineR::ACSN_maps$CellCycle),
   universe = "ACSN")



