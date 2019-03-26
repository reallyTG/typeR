library(DEVis)


### Name: get_de_data
### Title: Aggregate and retrieve data from multiple differentially
###   expressed result sets.
### Aliases: get_de_data
### Keywords: DE aggregate filter

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D 
##D /*
##D  * Data for all result sets will be included for each gene if that gene was found to be
##D  * differentially expressed in at least one of the provided result sets.
##D  * Filter based on a minimum fold-change.
##D  */
##D aggregated_lfc_union  <- get_de_data(res_list=myResList, method="union",
##D                                       type="lfc", lfc_filter=TRUE)
##D aggregated_pval_union <- get_de_data(res_list=myResList, method="union",
##D                                       type="padj", lfc_filter=TRUE)
##D 
##D 
##D /*
##D  * Data for all result sets will be included for each gene only if that gene was found to
##D  * be differentially expressed in all provided result sets. Do not apply a fold-change filter.
##D  * Significance is determined only by p-value threshold.
##D  */
##D aggregated_lfc_intersect  <- get_de_data(res_list=myResList, method="intersection",
##D                                           type="lfc", lfc_filter=FALSE)
##D aggregated_pval_intersect <- get_de_data(res_list=myResList, method="intersection",
##D                                           type="padj", lfc_filter=FALSE)
##D 
## End(Not run)



