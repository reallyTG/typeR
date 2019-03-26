library(embryogrowth)


### Name: TSP.list
### Title: Database of thermosensitive period of development for sex
###   determination
### Aliases: TSP.list
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(TSP.list)
##D names(TSP.list)
##D reference <- "Emys_orbicularis.mass"
##D metric <- TSP.list[[reference]]
##D TSP.begin <- attributes(TSP.list[[reference]])$TSP.begin.stages
##D TSP.end <- attributes(TSP.list[[reference]])$TSP.end.stages
##D # Metric at the beginning of the TSP
##D del <- ifelse(all(metric$stages == TSP.begin - 1)==FALSE, 0, 1)
##D (metric$metric[metric$stages == TSP.begin - del] +
##D     metric$metric[metric$stages == TSP.begin]) / 2
##D # Metric at the end of the TSP
##D del <- ifelse(all(metric$stages == TSP.begin + 1)==FALSE, 0, 1)
##D (metric$metric[metric$stages == TSP.end] +
##D         metric$metric[metric$stages == del + TSP.end]) / 2
## End(Not run)



