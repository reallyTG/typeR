library(SensoMineR)


### Name: analyse_holos
### Title: Analyse Holos data
### Aliases: analyse_holos

### ** Examples

## Not run: 
##D data(videos)
##D 
##D # Example with Napping data
##D res.N <- analyse_holos(videos, method = "N", export.res = TRUE)
##D res.N$summary.task$nbstep.time # number of steps and duration of the task for each subject
##D res.N$summary.task$freq[[1]] # number of times the first subject moved each stimulus during the task
##D res.N$res.FA # MFA results that can be customized with the plot.MFA function of FactoMineR
##D res.N$datasets$digitdata[[1]] # digit-tracking data of the first subject
##D res.N$datasets$finaldata # Napping data (panel level)
##D 
##D # Example with Sorting data
##D res.S <- analyse_holos(videos, method = "S")
##D res.S$res.FA # MCA results that can be customized with the plot.MCA function of FactoMineR
##D res.S$datasets # Sorting data (panel level)
##D sorting.data <- apply(res.S$datasets, 2, as.factor) ?
##D res.fast <- fast(sorting.data)
##D ConsensualWords(res.fast)
## End(Not run)



