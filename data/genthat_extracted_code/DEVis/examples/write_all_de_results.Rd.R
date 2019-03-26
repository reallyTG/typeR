library(DEVis)


### Name: write_all_de_results
### Title: Write differentially expressed gene data for multiple result
###   sets to file.
### Aliases: write_all_de_results
### Keywords: DE contrast output result

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Write differentally expressed gene data for each contrast to file.
##D #Include a minimum fold change filter. This will output 3 files.
##D write_all_de_results(res_list=myResList, lfc_filter=TRUE)
##D 
## End(Not run)



