library(LPStimeSeries)


### Name: tunelearnPattern
### Title: Tune Parameters of LPS for Time Series Classification
### Aliases: tunelearnPattern
### Keywords: tree classification regression

### ** Examples

data(GunPoint)
set.seed(71)

## Tune segment length level and depth on GunPoint training series
tuned=tunelearnPattern(GunPoint$trainseries,GunPoint$trainclass)
print(tuned$best.error)
print(tuned$best.seg)
print(tuned$best.depth)

## Use tuned parameters to learn patterns
ensemble=learnPattern(GunPoint$trainseries,segment.factor=tuned$best.seg,
					  maxdepth=tuned$best.depth)

## Find the similarity between test and training series based on the learned model
similarity=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries)

## Find the index of 1 nearest neighbor (1NN) training series for each test series
NearestNeighbor=apply(similarity,1,which.min)

## Predicted class for each test series
predicted=GunPoint$trainclass[NearestNeighbor]

## Compute the percentage of accurate predictions
accuracy=sum(predicted==GunPoint$testclass)/nrow(GunPoint$testseries)
print(100*accuracy)




