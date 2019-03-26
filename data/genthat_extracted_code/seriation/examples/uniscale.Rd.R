library(seriation)


### Name: uniscale
### Title: Unidimensional Scaling from Seriation Results
### Aliases: uniscale orderplot
### Keywords: optimize

### ** Examples

data(SupremeCourt)

d <- as.dist(SupremeCourt)

sc <- uniscale(d)
sc

orderplot(sc)



