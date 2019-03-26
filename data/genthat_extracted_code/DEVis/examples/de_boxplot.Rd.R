library(DEVis)


### Name: de_boxplot
### Title: Visualize differentially expressed genes as a function of
###   experimental design.
### Aliases: de_boxplot
### Keywords: DE boxplot distribution expression visualization

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Plot differentially expressed genes for the aggregate result sets.
##D de_boxplot(res_list=myResList, filename="DE_condition_time_boxplot.pdf",
##D             theme=2, returnData=FALSE)
##D 
## End(Not run)



