library(robCompositions)


### Name: compareMahal
### Title: Compares Mahalanobis distances from two approaches
### Aliases: compareMahal getEstimates print.estimates plot.estimates
###   plot.mahal

### ** Examples


data(arcticLake)
# generate some zeros
arcticLake[1:10, 1] <- 0
arcticLake[11:20, 2] <- 0
m <- compareMahal(arcticLake)
plot(m)



