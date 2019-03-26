library(DEVis)


### Name: de_filter
### Title: Apply a custom fold-change filter to an aggregated data frame.
### Aliases: de_filter
### Keywords: aggregate filter fold-change sort subset

### ** Examples

## Not run: 
##D 
##D #Prepare a result list.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Prepare an aggregate master data frame.
##D aggregate_df <- create_master_res(res_list=myResList, filename="master_DE.txt")
##D 
##D /*
##D  * Filter the aggregate data to contain only genes whose gene-wise maximum
##D  * fold-change is greater than 10. This will return genes whose gene-wise maximum
##D  * is > 10.
##D  */
##D de_filtered <- de_filter(master_df=aggregate_df, metric="max", threshold=10,
##D                           operator="greater", absolute=FALSE)
##D 
##D 
##D /*
##D  * Filter the aggregate data to contain only genes whose gene-wise minimum
##D  * fold-change is greater than an absoulte value of 4.  This will return genes
##D  * where the gene-wise minimum is < -4 and > +4.
##D  */
##D de_filtered <- de_filter(master_df=aggregate_df, metric="min", threshold=4,
##D                           operator="greater", absolute=TRUE)
##D 
##D 
##D /*
##D  * Filter the aggregate data to contain only genes whose gene-wise standard
##D  * deviation is less than an absoulte value of 2.  This will return genes
##D  * where the gene-wise standard deviation is > -2 and < +2.
##D  */
##D de_filtered <- de_filter(master_df=aggregate_df, metric="sd", threshold=2,
##D                           operator="less", absolute=TRUE)
##D 
## End(Not run)



