library(WeightedCluster)


### Name: wcSilhouetteObs
### Title: Compute the silhouette of each object using weighted data.
### Aliases: wcSilhouetteObs

### ** Examples

data(mvad)
## Aggregating state sequence
aggMvad <- wcAggregateCases(mvad[, 17:86], weights=mvad$weight)

## Creating state sequence object
mvad.seq <- seqdef(mvad[aggMvad$aggIndex, 17:86], weights=aggMvad$aggWeights)
## Computing Hamming distance between sequence
diss <- seqdist(mvad.seq, method="HAM")

## KMedoids using PAMonce method (clustering only)
clust5 <- wcKMedoids(diss, k=5, weights=aggMvad$aggWeights, cluster.only=TRUE)

## Compute the silhouette of each observation
sil <- wcSilhouetteObs(diss, clust5, weights=aggMvad$aggWeights, measure="ASWw")

## If you want to compute the average silhouette width, 
## you should take weights into account
weighted.mean(sil, w=aggMvad$aggWeights)

## Plotting sequences ordred by silhouette width, 
## best classified are draw on the top.
seqIplot(mvad.seq, group=clust5, sortv=sil)




