library(ACSNMineR)


### Name: multisample_enrichment
### Title: Automated gene set analysis for multiple sets
### Aliases: multisample_enrichment

### ** Examples

multisample_enrichment(Genes_by_sample = list(set1 = genes_test,set2=c(genes_test,"PTPRD")),
maps = list(cellcycle = ACSNMineR::ACSN_maps$CellCycle),
min_module_size = 10,
universe = "ACSN",cohort_threshold = FALSE)



