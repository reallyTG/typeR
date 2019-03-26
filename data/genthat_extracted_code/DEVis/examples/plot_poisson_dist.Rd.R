library(DEVis)


### Name: plot_poisson_dist
### Title: Visualize the poisson distances between samples.
### Aliases: plot_poisson_dist
### Keywords: batch cluster distance outlier poisson

### ** Examples

## Not run: 
##D 
##D #Visualize Euclidian distances of all samples using "SampleID" target data as labels.
##D plot_poisson_dist("SampleID", filename="poisson_distance.pdf", theme=2, returnData=FALSE)
##D 
##D #Visualize Euclidian distances of all samples using "timepoint" target data as labels.
##D #Store the resulting distance matrix data.
##D distMatrix <- plot_poisson_dist("timepoint", filename="poisson_distance.pdf",
##D                                  theme=2, returnData=TRUE)
##D 
## End(Not run)



