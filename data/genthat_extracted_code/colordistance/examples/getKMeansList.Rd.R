library(colordistance)


### Name: getKMeansList
### Title: Get KMeans clusters for every image in a set
### Aliases: getKMeansList

### ** Examples

## Not run: 
##D # Takes a few seconds to run
##D kmeans_list <- colordistance::getKMeansList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), bins=3,
##D lower=rep(0.8, 3), upper=rep(1, 3), plotting=TRUE)
## End(Not run)



