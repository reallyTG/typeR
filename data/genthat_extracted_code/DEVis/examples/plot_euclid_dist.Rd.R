library(DEVis)


### Name: plot_euclid_dist
### Title: Visualize the Euclidian distances between samples.
### Aliases: plot_euclid_dist
### Keywords: Euclidian batch cluster distance outlier

### ** Examples

## Not run: 
##D 
##D #Visualize Euclidian distances of all samples using "SampleID" target data as labels.
##D plot_euclid_dist("SampleID", filename="euclidian_distance.pdf",
##D                    theme=2, returnData=FALSE)
##D 
##D #Visualize Euclidian distances of all samples using "timepoint" target data as labels.
##D #Store the resulting distance matrix data.
##D distMatrix <- plot_euclid_dist("timepoint", filename="euclidian_distance.pdf",
##D                                  theme=2, returnData=TRUE)
##D 
## End(Not run)



