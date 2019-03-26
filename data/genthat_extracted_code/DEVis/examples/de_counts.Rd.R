library(DEVis)


### Name: de_counts
### Title: Visualize differentially expressed gene counts as a stacked
###   barplot.
### Aliases: de_counts
### Keywords: DE counts summary visualization

### ** Examples

## Not run: 
##D 
##D #Prepare a result list for aggregation.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Visualize count data for the result set and save the results.
##D de_counts(res_set=myResList, filename="DE_counts.png", theme=2)
##D 
## End(Not run)



