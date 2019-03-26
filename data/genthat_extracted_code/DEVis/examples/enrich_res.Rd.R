library(DEVis)


### Name: enrich_res
### Title: Incorporate additional data about differentially expressed genes
###   into a DESeq2 result set.
### Aliases: enrich_res
### Keywords: DE aggregate

### ** Examples

## Not run: 
##D 
##D #Enrich a result set. This will make several new data points available.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D enriched_result <- enrich_res(res.day1)
##D 
##D #Print number of differentially expressed genes.
##D print(enriched_result@numDE)
##D 
##D #Get the names of all up-regulated differentially expressed genes.
##D upreg_de_genes <- enriched_result@upNames
## End(Not run)



