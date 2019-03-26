library(LPStimeSeries)


### Name: computeSimilarity
### Title: Compute similarity between time series based on learned patterns
### Aliases: computeSimilarity
### Keywords: similarity tree

### ** Examples


data(GunPoint)
set.seed(71)
## Learn patterns on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries)

## Find the similarity between test and training series
sim=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries)

## Find similarity using representations, 
## First generate representations
trainRep=predict(ensemble, GunPoint$trainseries, nodes=TRUE)
testRep=predict(ensemble, GunPoint$testseries, nodes=TRUE)

## Then compute the similarity (city-block distance), 
## takes longer but we keep the representation
sim2=computeSimilarity(testrepresentation=testRep,refrepresentation=trainRep)

## Find the similarity based on first 100 trees
sim=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries,which.tree=c(1:100))





