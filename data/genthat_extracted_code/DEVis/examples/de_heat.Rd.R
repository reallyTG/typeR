library(DEVis)


### Name: de_heat
### Title: Create heat maps of differentially expressed genes.
### Aliases: de_heat
### Keywords: filter heatmap sort visualization

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D /*
##D  * Create a heat map of the top 25 most upregulated genes based on time and condition.
##D  * Gene-wise max value based calculation.
##D  */
##D de_heat(res_list=myResList, anno_columns=c("Time", "Condition"), sort_choice="max",
##D          numGenes=25, theme=2, returnData=FALSE)
##D 
##D 
##D /*
##D  * Create a heat map of the top 50 most downregulated genes based on time and condition.
##D  * Mean based value calculation.
##D  */
##D de_heat(res_list=myResList, anno_columns=c("Time", "Condition"), sort_choice="min_mean",
##D          numGenes=50, theme=2, returnData=FALSE)
##D 
##D 
##D /*
##D  * Create a heat map of the top 100 most highly varying genes based on time and response.
##D  * Variance based value calculation.
##D  */
##D de_heat(res_list=myResList, anno_columns=c("Time", "Response"), sort_choice="variance",
##D          numGenes=100, theme=2, returnData=FALSE)
##D 
##D /*
##D  * Plot 3 specific genes, dont cluster by contrast.
##D  */
##D de_heat(res_list=myResList, anno_columns=c("Time", "Response"), sort_choice="variance",
##D         specific_genes=c("GEN1", "ABC2", "FuSG2"), theme=2, cluster_contrasts=FALSE)
##D 
## End(Not run)



