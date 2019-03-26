library(colordistance)


### Name: getHistList
### Title: Generate a list of cluster sets for multiple images
### Aliases: getHistList

### ** Examples

## Not run: 
##D # Takes >10 seconds if you run all examples
##D clusterList <- colordistance::getHistList(system.file("extdata",
##D "Heliconius/Heliconius_B", package="colordistance"), upper = rep(1, 3),
##D lower = rep(0.8, 3))
##D 
##D clusterList <- colordistance::getHistList(c(system.file("extdata",
##D "Heliconius/Heliconius_B", package="colordistance"), system.file("extdata",
##D "Heliconius/Heliconius_A", package="colordistance")), pausing = FALSE,
##D upper = rep(1, 3), lower = rep(0.8, 3))
##D 
##D clusterList <- colordistance::getHistList(system.file("extdata",
##D "Heliconius/Heliconius_B", package = "colordistance"), plotting = TRUE,
##D upper = rep(1, 3), lower = rep(0.8, 3))
## End(Not run)




