library(optmatch)


### Name: matched.distances
### Title: Determine distances between matched units
### Aliases: matched.distances
### Keywords: nonparametric

### ** Examples


data(plantdist)
plantsfm <- fullmatch(plantdist)
(plantsfm.d <- matched.distances(plantsfm,plantdist,pres=TRUE))
unlist(lapply(plantsfm.d, max))
mean(unlist(plantsfm.d))



