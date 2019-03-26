library(LPStimeSeries)


### Name: visualizePattern
### Title: Plot of the patterns learned by the ensemble of the regression
###   trees
### Aliases: visualizePattern
### Keywords: similarity

### ** Examples

set.seed(71)
data(GunPoint)
## Learn patterns on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries)

## Find representations
trainRep=predict(ensemble, GunPoint$trainseries, nodes=TRUE)

## Find the average frequency over the terminal nodes
avgFreq=apply(trainRep,2,mean)

## Find the terminal node that has the maximum average and visualize
termid=which.max(avgFreq)
visualizePattern(ensemble,GunPoint$trainseries,termid,c(2,1))




