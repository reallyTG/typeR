library(DEVis)


### Name: de_series
### Title: Identify and visualize patterns of expression between
###   differentially expressed genes across a series of result sets.
### Aliases: de_series
### Keywords: DE aggregate cluster similarity visualization

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
##D  * Cluster genes by similarity into 5 groups, then visualize their expression over the
##D  * course of the series using a generalized linear model.
##D  */
##D de_series(res_list=myResList, filename="DE_series_pattern.pdf",
##D              designVar="Condition_Time",
##D              groupBy="Time", numGroups=5, theme=1, method="glm",
##D              returnData=FALSE, writeData=FALSE)
##D 
##D 
##D /*
##D  * Cluster genes by similarity into 3 groups, then visualize their expression over the
##D  * course of the series using based on mean group expression values.
##D  */
##D de_series(res_list=myResList, filename="DE_series_pattern.pdf",
##D              designVar="Condition_Time",
##D              groupBy="Time", numGroups=3, theme=2, method="mean",
##D              returnData=FALSE, writeData=FALSE)
##D 
##D  
## End(Not run)



