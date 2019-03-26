library(DEVis)


### Name: de_density_plot
### Title: Visualize density plots of fold-change or significance values
###   for aggregated data sets.
### Aliases: de_density_plot
### Keywords: DE aggregate density fold-change p-value visualization

### ** Examples

## Not run: 
##D 
##D  #This example assumes an experimenal design of ~Condition_Time.
##D 
##D #Prepare a result list.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D /*
##D  * Aggregate data for all contrasts in the result list using union aggregation.
##D  * Display the density plot of p-values for the aggregated data.
##D  */
##D de_density_plot(res_list=myResList, filename="DE_density_union_pval.pdf",
##D                  type="pval", method="union", returnData=FALSE)
##D 
##D /*
##D  * Aggregate data for all contrasts in the result list using intersection aggregation.
##D  * Display the density plot of log fold-change values for the aggregated data.
##D  * Store the aggregate data as DE_lfc_intersect_df.
##D  */
##D DE_lfc_intersect_df <- de_density_plot(res_list=myResList,
##D                                         filename="DE_density_union_pval.pdf",
##D                                         type="lfc", method="intersection",
##D                                         returnData=TRUE)
##D 
## End(Not run)



