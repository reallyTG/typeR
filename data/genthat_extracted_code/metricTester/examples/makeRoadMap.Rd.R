library(metricTester)


### Name: makeRoadMap
### Title: Create a road map for use in FDis-related functions
### Aliases: makeRoadMap

### ** Examples

#simulate trait data for a series of individuals. to illustrate the point, simulate
#varying numbers of individuals per
#species, and where there are varying degrees of variance in traits per species. 
traits <- data.frame(trait1=c(rnorm(n=30, sd=1), rnorm(n=60, sd=2), rnorm(n=120,sd=4)),
trait2=c(rnorm(n=30, sd=1), rnorm(n=60, sd=2), rnorm(n=120, sd=4)))

#ordinate those trait data
ord <- prcomp(traits)

#pull out the positions of the points in the ordination space, and specify which
#species those individuals belong to
ex <- data.frame(ord$x)
ex$species <- c(rep("species1", 30), rep("species2",30), rep("species3",150))

test <- makeRoadMap(ex)



