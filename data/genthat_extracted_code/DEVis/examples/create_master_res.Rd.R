library(DEVis)


### Name: create_master_res
### Title: Create a data set consisting of aggregated data for multiple
###   contrasts.
### Aliases: create_master_res
### Keywords: DE aggregate filter master result

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Generate the master DE data frame using union-based aggregation
##D master_df <- create_master_res(res_list=myResList, filename="master_DE.txt",
##D                                method="union")
##D 
##D #Generate the master DE data frame using intersection-based aggregation.
##D #Filter genes below minimum log fold-change.
##D master_df <- create_master_res(res_list=myResList, filename="master_DE.txt",
##D                                method="union", lfc_filter=TRUE)
##D 
## End(Not run)



