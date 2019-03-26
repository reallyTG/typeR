library(DEVis)


### Name: de_profile_plot
### Title: Visualize gene-wise expression of differentially expressed
###   genes.
### Aliases: de_profile_plot
### Keywords: DE aggregate expression fold-change sort visualization

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
##D  * Sort data by the highest expression level for any individual gene in any sample.
##D  * Select the top 50 genes from this sort and visualize them in the plot.
##D  */
##D de_profile_plot(res_list=myResList, filename="DE_profile_upReg50.pdf",
##D                   sort_choice="max",
##D                   numGenes=50, theme=1, returnData=FALSE)
##D 
##D /*
##D  * Calculate the mean expression for each gene across all three time points.
##D  * Sort the data by minimum mean expression, select the top 25 genes,
##D  * and visualize them in the plot.
##D  */
##D de_profile_plot(res_list=myResList, filename="DE_profile_meanDownReg25.pdf",
##D                   sort_choice="min_mean",
##D                   numGenes=25, theme=1, returnData=FALSE)
##D 
##D 
##D /*
##D  * Calculate the variance for each gene across all three time points.
##D  * Sort the data by the highest gene-wise variance, select 30 genes
##D  * with the highest variance, and visualize them in the plot.
##D  * Save the data used to generate the plot as highVar_df.
##D  */
##D highVar_df <- de_profile_plot(res_list=myResList, filename="DE_profile_highVar30.pdf",
##D                                 sort_choice="variance", numGenes=30, theme=1, returnData=TRUE)
##D 
## End(Not run)



