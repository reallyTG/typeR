library(DEVis)


### Name: de_diverge_plot
### Title: Visualize fold-change divergence for differentially expressed
###   genes.
### Aliases: de_diverge_plot
### Keywords: DE expression fold-change visualization

### ** Examples

## Not run: 
##D 
##D #Prepare a result list.
##D res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
##D res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
##D res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
##D myResList <- list(res.day1, res.day2, res.day3)
##D 
##D #Create the plot.
##D de_diverge_plot(res_list=myResList, filename="DE_divergence_plot.pdf",
##D                  theme=1, returnData=FALSE)
##D 
## End(Not run)



