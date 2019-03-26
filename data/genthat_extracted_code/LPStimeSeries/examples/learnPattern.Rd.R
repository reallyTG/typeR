library(LPStimeSeries)


### Name: learnPattern
### Title: Learn Local Auto-Patterns for Time Series Representation and
###   Similarity
### Aliases: learnPattern learnPattern.default print.learnPattern
### Keywords: similarity tree classification regression

### ** Examples

data(GunPoint)
set.seed(71)

## Learn patterns on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries)
print(ensemble)

## Find the similarity between test and training series based on the learned model
similarity=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries)

## Find the index of 1 nearest neighbor (1NN) training series for each test series
NearestNeighbor=apply(similarity,1,which.min)

## Predicted class for each test series
predicted=GunPoint$trainclass[NearestNeighbor]

## Compute the percentage of accurate predictions
accuracy=sum(predicted==GunPoint$testclass)/nrow(GunPoint$testseries)
print(100*accuracy)

## Learn patterns randomly on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries, random.split=1)

## Find the similarity between test and training series and classify test series
similarity=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries)
NearestNeighbor=apply(similarity,1,which.min)
predicted=GunPoint$trainclass[NearestNeighbor]
accuracy=sum(predicted==GunPoint$testclass)/nrow(GunPoint$testseries)
print(100*accuracy)

## Learn patterns by training each tree on a random subsample
## and classify test time series
ensemble=learnPattern(GunPoint$trainseries,replace=TRUE)
similarity=computeSimilarity(ensemble,GunPoint$testseries,GunPoint$trainseries)
NearestNeighbor=apply(similarity,1,which.min)
predicted=GunPoint$trainclass[NearestNeighbor]
print(predicted)

## Learn patterns and do predictions on OOB time series
ensemble=learnPattern(GunPoint$trainseries,replace=TRUE,target.diff=FALSE,oob.pred=TRUE)
## Plot first series and its OOB approximation
plot(GunPoint$trainseries[1,],xlab='Time',ylab='Observation',
	type='l',lty=1,lwd=2)
points(c(1:ncol(GunPoint$trainseries)),ensemble$oobpredictions[1,],
	type='l',col=2,lty=2,lwd=2)
legend('topleft',c('Original series','Approximation'),
	col=c(1,2),lty=c(1,2),lwd=2)




