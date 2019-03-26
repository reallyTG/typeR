library(flexclust)


### Name: randIndex
### Title: Compare Partitions
### Aliases: comPart comPart,flexclust,flexclust-method
###   comPart,numeric,numeric-method comPart,flexclust,numeric-method
###   comPart,numeric,flexclust-method randIndex
###   randIndex,table,missing-method randIndex,ANY,ANY-method
### Keywords: cluster

### ** Examples

## no class correlations: corrected Rand almost zero
g1 <- sample(1:5, size=1000, replace=TRUE)
g2 <- sample(1:5, size=1000, replace=TRUE)
tab <- table(g1, g2)
randIndex(tab)

## uncorrected version will be large, because there are many points
## which are assigned to different clusters in both cases
randIndex(tab, correct=FALSE)
comPart(g1, g2)

## let pairs (g1=1,g2=1) and (g1=3,g2=3) agree better
k <- sample(1:1000, size=200)
g1[k] <- 1
g2[k] <- 1
k <- sample(1:1000, size=200)
g1[k] <- 3
g2[k] <- 3
tab <- table(g1, g2)

## the index should be larger than before
randIndex(tab, correct=TRUE, original=TRUE)
comPart(g1, g2)



