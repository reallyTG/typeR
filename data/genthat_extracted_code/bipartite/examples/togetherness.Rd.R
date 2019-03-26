library(bipartite)


### Name: togetherness
### Title: Calculates the number of identical co-presences and co-absences
###   for species-on-islands
### Aliases: togetherness
### Keywords: package

### ** Examples

(m <- matrix(c(0,1,0,0,1,1,0,1,1,0), ncol=2, byrow=TRUE))
togetherness(m)
# or, with two togethernesses:
(n <- matrix(c(0,1,1,0,1,1,0,0,1,1,0,1,0,1), ncol=2, byrow=TRUE))
togetherness(n, normalise=FALSE)

data(Safariland)
togetherness(m)



