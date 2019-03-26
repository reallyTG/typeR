library(RankAggreg)


### Name: geneLists
### Title: Ordered Gene Lists from 5 microarray studies
### Aliases: geneLists
### Keywords: datasets

### ** Examples

data(geneLists)
topList <- RankAggreg(geneLists, 5, N=700, seed=100, convIn=3)
plot(topList)



